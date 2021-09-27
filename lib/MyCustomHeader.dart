import 'package:flutter/material.dart';

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  MyCustomHeader(this.item);

  final Widget item;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///디바이더, height 1
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xfff7f7f7),
            ),
            item,
          ],
        ));
  }

  @override
  double get maxExtent => 60 +3;

  @override
  double get minExtent => 60 +3;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
