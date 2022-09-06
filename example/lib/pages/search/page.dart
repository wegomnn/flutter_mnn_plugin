import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wego_mnn_example/style/theme.dart';
import 'logic.dart';

class SearchPage extends StatelessWidget {
  final logic = Get.put(SearchLogic());
  final String title;

  SearchPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GetBuilder<SearchLogic>(builder: (logic) {
        return CustomScrollView(
          ///反弹效果
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _headerWidget(logic),
            ),
            _gridWidget(logic),
          ],
        );
      }),
    );
  }

  Widget _headerWidget(SearchLogic logic) {
    return Container(
      padding:
          const EdgeInsets.fromLTRB(SyDimen.SIZE_15, 0, SyDimen.SIZE_15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.file(
            File(logic.targetImagePath),
            width: SyDimen.SIZE_100,
            height: SyDimen.SIZE_100,
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              Text(
                logic.tips,
                style: SyFont.primaryTipsText,
              ),
            ],
          ),
          SyStyle.vGap5,
        ],
      ),
    );
  }

  Widget _gridWidget(SearchLogic logic) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: SyDimen.SIZE_15),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          ///九宫格的列数
          crossAxisCount: 3,

          ///子Widget 宽与高的比值
          childAspectRatio: 10 / 10,

          ///主方向的 两个 子Widget 之间的间距
          mainAxisSpacing: SyDimen.SIZE_5,

          ///次方向 子Widget 之间的间距
          crossAxisSpacing: SyDimen.gridGap,
        ),

        ///子Item构建器
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            ///每一个子Item的样式
            return GestureDetector(
              child: Container(
                color: SyColor.white,
                // child: SyImage.build(type: ImageType.network, uri: uri),
                child: Image.file(
                  File(logic.dataList[index]),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },

          ///子Item的个数
          childCount: logic.dataList.length,
        ),
      ),
    );
  }
}
