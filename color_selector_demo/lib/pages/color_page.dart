import 'package:flutter/material.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({super.key});

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> with ColorsUtility {
  Color _backgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: null,
        title: const Text(
          'Colors',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          FloatingActionButton.extended(
            label: Text(
              'Reset',
              style: TextStyle(color: _whiteColor),
            ),
            onPressed: () {},
            backgroundColor: _blackColor,
          )
        ],
        backgroundColor: _blackColor,
      ),
      body: Column(
        children: [
          Expanded(flex: 6, child: Container(color: _backgroundColor)),
          Expanded(
              flex: 1,
              child: Container(
                decoration:
                    BoxDecoration(color: _backgroundColor, border: const Border.fromBorderSide(BorderSide.none)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: FloatingActionButton.extended(
                          label: const Text('Yellow'),
                          foregroundColor: _whiteColor,
                          backgroundColor: _yellowColor,
                          onPressed: () {
                            setState(() {
                              _backgroundColor = _yellowColor;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: FloatingActionButton.extended(
                          label: const Text('Blue'),
                          backgroundColor: _blueColor,
                          foregroundColor: _whiteColor,
                          onPressed: () {
                            setState(() {
                              _backgroundColor = _blueColor;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: FloatingActionButton.extended(
                          label: const Text('Green'),
                          backgroundColor: _greenColor,
                          foregroundColor: _whiteColor,
                          onPressed: () {
                            setState(() {
                              _backgroundColor = _greenColor;
                            });
                          }),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

mixin ColorsUtility {
  final Color _greenColor = Colors.green;
  final Color _yellowColor = Colors.yellow;
  final Color _blueColor = Colors.blue;
  final Color _blackColor = Colors.black;
  final Color _whiteColor = Colors.white;
}
