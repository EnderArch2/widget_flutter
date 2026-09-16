import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({super.key});

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 12),
  )..repeat();

  static const List<({FaIconData icon, Color color, double size})> _icons = [
    (icon: FontAwesomeIcons.html5, color: Colors.orange, size: 24.0),
    (icon: FontAwesomeIcons.css3, color: Colors.blue, size: 30.0),
    (icon: FontAwesomeIcons.squareJs, color: Colors.amber, size: 36.0),
    (icon: FontAwesomeIcons.react, color: Colors.cyan, size: 32.0),
    (icon: FontAwesomeIcons.vuejs, color: Colors.green, size: 32.0),
    (icon: FontAwesomeIcons.angular, color: Colors.red, size: 32.0),
    (icon: FontAwesomeIcons.nodeJs, color: Colors.lightGreen, size: 32.0),
    (icon: FontAwesomeIcons.python, color: Colors.indigo, size: 32.0),
    (icon: FontAwesomeIcons.java, color: Colors.deepOrange, size: 32.0),
    (icon: FontAwesomeIcons.php, color: Colors.blueGrey, size: 32.0),
    (icon: FontAwesomeIcons.laravel, color: Colors.redAccent, size: 32.0),
    (icon: FontAwesomeIcons.docker, color: Colors.blue, size: 32.0),
    (icon: FontAwesomeIcons.github, color: Colors.black87, size: 32.0),
    (icon: FontAwesomeIcons.gitlab, color: Colors.deepOrange, size: 32.0),
    (icon: FontAwesomeIcons.android, color: Colors.green, size: 32.0),
    (icon: FontAwesomeIcons.apple, color: Colors.black87, size: 32.0),
    (icon: FontAwesomeIcons.linux, color: Colors.amber, size: 32.0),
    (icon: FontAwesomeIcons.windows, color: Colors.lightBlue, size: 32.0),
    (icon: FontAwesomeIcons.aws, color: Colors.deepOrange, size: 32.0),
    (icon: FontAwesomeIcons.google, color: Colors.blue, size: 32.0),
    (icon: FontAwesomeIcons.figma, color: Colors.deepPurple, size: 32.0),
    (icon: FontAwesomeIcons.wordpress, color: Colors.blueGrey, size: 32.0),
    (icon: FontAwesomeIcons.bootstrap, color: Colors.purple, size: 32.0),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Widget', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final size = constraints.biggest;
              final center = Offset(size.width / 2, size.height / 2);
              final radius = math.max(
                0.0,
                math.min(size.width, size.height) / 2 - 40,
              );
              const fullTurn = 2 * math.pi;
              return Stack(
                children: [
                  for (final (index, entry) in _icons.indexed)
                    Positioned(
                      left: center.dx +
                          radius *
                              math.cos(
                                fullTurn * (index / _icons.length) +
                                    fullTurn * _controller.value,
                              ) -
                          entry.size / 2,
                      top: center.dy +
                          radius *
                              math.sin(
                                fullTurn * (index / _icons.length) +
                                    fullTurn * _controller.value,
                              ) -
                          entry.size / 2,
                      child: FaIcon(
                        entry.icon,
                        color: entry.color,
                        size: entry.size,
                        semanticLabel: index == 0 ? 'HTML 5 logo' : null,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
