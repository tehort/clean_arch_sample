import 'package:flutter/material.dart';

class ProgressHud extends StatefulWidget {
  const ProgressHud({Key? key, this.isTransparent = false}) : super(key: key);

  final bool isTransparent;

  @override
  _ProgressHudState createState() => _ProgressHudState();
}

class _ProgressHudState extends State<ProgressHud> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: widget.isTransparent == true ? 0 : 0.4,
          child: const ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        const Center(
          child: SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              strokeWidth: 6.5,
            ),
          ),
        ),
      ],
    );
  }
}
