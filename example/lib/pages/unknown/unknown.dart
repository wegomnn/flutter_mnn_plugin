import 'package:flutter/material.dart';

import '../../style/font.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          '404 页面跳转错误',
          style: SyFont.normalText,
        ),
      ),
    );
  }
}
