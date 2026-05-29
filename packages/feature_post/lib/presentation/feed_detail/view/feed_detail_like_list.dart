import 'package:flutter/material.dart';
import 'package:network/network.dart';

import 'feed_detail_like_list_item.dart';

class FeedDetailLikeList extends StatelessWidget {
  const FeedDetailLikeList({
    super.key,
    required this.likes,
    required this.onListTap,
    required this.onPrimaryAction,
  });

  final List<PostAuthorRelation> likes;
  final VoidCallback onListTap;
  final ValueChanged<PostAuthorRelation> onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    if (likes.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onListTap,
              child: const Center(child: Text('还没有人点赞')),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemCount: likes.length,
      itemBuilder: (context, index) => FeedDetailLikeListItem(
        user: likes[index],
        onTap: onListTap,
        onPrimaryAction: () {
          onListTap();
          onPrimaryAction(likes[index]);
        },
      ),
      separatorBuilder: (_, __) => const Divider(
        height: 24,
        color: Colors.transparent,
      ),
    );
  }
}
