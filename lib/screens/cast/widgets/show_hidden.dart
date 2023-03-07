import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ShowHideButton extends StatefulWidget {
  final String text;

  const ShowHideButton({Key? key, required this.text}) : super(key: key);

  @override
  _ShowHideButtonState createState() => _ShowHideButtonState();
}

class _ShowHideButtonState extends State<ShowHideButton> {
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_showText) widget.text.text.white.size(14).make(),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showText = !_showText;
            });
          },
          child: Text(
            _showText ? 'Hide Text' : 'Show Text',
          ),
        ),
      ],
    );
  }
}
