import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _cameraIndex = 0;
  String? _error;
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() {
          _error = 'No camera available on this device';
        });
        return;
      }
      await _startCamera(_cameraIndex);
    } on CameraException catch (e) {
      setState(() {
        _error = 'Failed to initialize camera: ${e.description ?? e.code}';
      });
    }
  }

  Future<void> _startCamera(int index) async {
    final controller = CameraController(
      _cameras[index],
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller = controller;
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      setState(() {
        _error = 'Failed to initialize camera: ${e.description ?? e.code}';
      });
      return;
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _flipCamera() async {
    if (_cameras.length < 2) return;
    final nextIndex = (_cameraIndex + 1) % _cameras.length;
    await _controller?.dispose();
    _cameraIndex = nextIndex;
    await _startCamera(nextIndex);
  }

  Future<void> _takePicture() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isCapturing) {
      return;
    }
    setState(() {
      _isCapturing = true;
    });
    try {
      final photo = await _controller!.takePicture();
      await _saveToGallery(photo.path);
    } on CameraException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to take picture: ${e.description ?? e.code}'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  Future<void> _saveToGallery(String path) async {
    try {
      final hasAccess = await Gal.hasAccess() || await Gal.requestAccess();
      if (!hasAccess) {
        _showSnackBar('Gallery access denied');
        return;
      }
      await Gal.putImage(path);
      _showSnackBar('Photo saved to gallery');
    } on GalException catch (e) {
      _showSnackBar('Failed to save: ${e.type.message}');
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'View',
          onPressed: () async {
            try {
              await Gal.open();
            } on GalException {
              _showSnackBar('Could not open gallery');
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Camera Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.no_photography,
                      color: Colors.red,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _error = null;
                        });
                        _initCamera();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: _controller != null && _controller!.value.isInitialized
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CameraPreview(_controller!),
                            if (_isCapturing)
                              const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: _cameras.length > 1 ? _flipCamera : null,
                        icon: const Icon(Icons.flip_camera_ios, size: 32),
                        color: Colors.purpleAccent,
                      ),
                      GestureDetector(
                        onTap: _takePicture,
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: _isCapturing
                              ? const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : const Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                  size: 36,
                                ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            await Gal.open();
                          } on GalException {
                            _showSnackBar('Could not open gallery');
                          }
                        },
                        icon: const Icon(Icons.photo_library, size: 32),
                        color: Colors.purpleAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
