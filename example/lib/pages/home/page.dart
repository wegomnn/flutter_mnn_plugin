import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wego_mnn_example/style/theme.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GetBuilder<HomeLogic>(builder: (logic) {
        return Container(
          padding: const EdgeInsets.all(SyDimen.SIZE_15),
          child: Column(
            children: <Widget>[
              SyStyle.buildConfirmButton(
                  label: logic.unzipLabel, onPressed: logic.unzipImage),
              SyStyle.vGap15,
              SyStyle.buildConfirmButton(
                  label: "图片批量解析", onPressed: logic.gotoBatchPage),
              SyStyle.vGap15,
              SyStyle.buildConfirmButton(
                  label: "图片追加解析", onPressed: logic.gotoAppendPage),
              SyStyle.vGap15,
            ],
          ),
        );
      }),
    );
  }
}
