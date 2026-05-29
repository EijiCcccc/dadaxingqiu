import 'package:flutter/material.dart';

class FeedDetailTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  const FeedDetailTabBarHeaderDelegate();

  static const _tabBar = TabBar(
    dividerColor: Colors.transparent,
    tabs: [
      Tab(text: '评论'),
      Tab(text: '点赞'),
    ],
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white.withOpacity( 0.92),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant FeedDetailTabBarHeaderDelegate oldDelegate) {
    return false;
  }
}
