import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/progress_hud.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const ProgressHud();
  }
}
