import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '/' || buttonText == 'X') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print('Already contains a decimals');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color colors) {
    return SizedBox(
      width: 85,
      height: 100,
      child: FloatingActionButton(
        backgroundColor: colors,
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: styleButtonText().buttonText,
        ),
      ),
    );
  }

  Widget bottomBuildButton(String buttonText, Color colors) {
    return SizedBox(
      width: 210,
      height: 80,
      child: FloatingActionButton.extended(
        backgroundColor: colors,
        onPressed: () => buttonPressed(buttonText),
        label: Text(
          buttonText,
          style: styleButtonText().buttonText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Container(
            color: const Color(0xFF0f0f0f),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                    child: Text(output,
                        style: const TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                        ))),
                const Expanded(
                  child: Divider(color: Color(0xFF005B41)),
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("7", const Color(0xFF232d3f)),
                      buildButton("8", const Color(0xFF232d3f)),
                      buildButton("9", const Color(0xFF232d3f)),
                      buildButton("/", const Color(0xFF005B41)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("4", const Color(0xFF232d3f)),
                      buildButton("5", const Color(0xFF232d3f)),
                      buildButton("6", const Color(0xFF232d3f)),
                      buildButton("X", const Color(0xFF005B41)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("1", const Color(0xFF232d3f)),
                      buildButton("2", const Color(0xFF232d3f)),
                      buildButton("3", const Color(0xFF232d3f)),
                      buildButton("-", const Color(0xFF005B41)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton(".", const Color(0xFF232d3f)),
                      buildButton("0", const Color(0xFF232d3f)),
                      buildButton("00", const Color(0xFF232d3f)),
                      buildButton("+", const Color(0xFF005B41)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottomBuildButton("CLEAR", const Color(0xFF008170)),
                      bottomBuildButton("=", const Color(0xFF008170)),
                    ],
                  )
                ])
              ],
            )));
  }
}

class F0F0F {}

class styleButtonText {
  TextStyle buttonText = const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white);
}
