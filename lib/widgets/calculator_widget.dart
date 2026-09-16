import 'package:flutter/material.dart';

/// Sealed hierarchy for calculator button operation tokens.
sealed class CalcAction {}

class NumberAction extends CalcAction {
  final String digit;
  NumberAction(this.digit);
}

class OperatorAction extends CalcAction {
  final String op;
  OperatorAction(this.op);
}

class ClearAction extends CalcAction {}

class BackspaceAction extends CalcAction {}

class DecimalAction extends CalcAction {}

class EqualsAction extends CalcAction {}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _output = '0';
  String _expression = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  bool _isOperandPressed = false;

  void _handleAction(CalcAction action) {
    setState(() {
      switch (action) {
        case ClearAction():
          _output = '0';
          _expression = '';
          _num1 = 0;
          _num2 = 0;
          _operand = '';
          _isOperandPressed = false;

        case BackspaceAction():
          _output = _output.length > 1
              ? _output.substring(0, _output.length - 1)
              : '0';

        case OperatorAction(:var op):
          _num1 = double.tryParse(_output) ?? 0;
          _operand = op;
          _expression = '$_output $op';
          _isOperandPressed = true;

        case DecimalAction():
          if (!_output.contains('.')) {
            _output = '$_output.';
          }

        case EqualsAction():
          if (_operand.isNotEmpty) {
            _num2 = double.tryParse(_output) ?? 0;
            _expression = '$_expression $_output =';

            final result = switch (_operand) {
              '+' => _num1 + _num2,
              '-' => _num1 - _num2,
              '×' => _num1 * _num2,
              '÷' => _num2 != 0 ? _num1 / _num2 : null,
              _ => null,
            };

            if (result == null) {
              _output = 'Error';
            } else {
              _output = result.toString();
              if (_output.endsWith('.0')) {
                _output = _output.substring(0, _output.length - 2);
              }
            }

            _operand = '';
            _isOperandPressed = false;
          }

        case NumberAction(:var digit):
          if (_output == '0' || _isOperandPressed) {
            _output = digit;
            _isOperandPressed = false;
          } else {
            _output += digit;
          }
      }
    });
  }

  Widget _buildButton(
    String text,
    CalcAction action, {
    Color? color,
    Color textColor = Colors.black,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _handleAction(action),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _output,
                    style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton(
                      'C',
                      ClearAction(),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                    ),
                    _buildButton(
                      '⌫',
                      BackspaceAction(),
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                    ),
                    _buildButton(
                      '÷',
                      OperatorAction('÷'),
                      color: Colors.purpleAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('7', NumberAction('7')),
                    _buildButton('8', NumberAction('8')),
                    _buildButton('9', NumberAction('9')),
                    _buildButton(
                      '×',
                      OperatorAction('×'),
                      color: Colors.purpleAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('4', NumberAction('4')),
                    _buildButton('5', NumberAction('5')),
                    _buildButton('6', NumberAction('6')),
                    _buildButton(
                      '-',
                      OperatorAction('-'),
                      color: Colors.purpleAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1', NumberAction('1')),
                    _buildButton('2', NumberAction('2')),
                    _buildButton('3', NumberAction('3')),
                    _buildButton(
                      '+',
                      OperatorAction('+'),
                      color: Colors.purpleAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('0', NumberAction('0')),
                    _buildButton('.', DecimalAction()),
                    _buildButton(
                      '=',
                      EqualsAction(),
                      color: Colors.purpleAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
