import 'package:flutter/material.dart';
import 'package:network/network.dart';

import '../feed_detail_state.dart';

class FeedDetailMoreActionsSheet extends StatelessWidget {
  const FeedDetailMoreActionsSheet({
    super.key,
    required this.state,
    required this.onSelectVisibility,
    required this.onDelete,
    required this.showDelete,
  });

  final PostDetailState state;
  final ValueChanged<PostVisibility> onSelectVisibility;
  final Future<void> Function() onDelete;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final option in _visibilityOptions)
            ListTile(
              enabled: !state.isUpdatingVisibility,
              title: Text(option.label),
              trailing: state.post.visibility == option.visibility
                  ? const Icon(Icons.check)
                  : null,
              onTap: () => onSelectVisibility(option.visibility),
            ),
          if (showDelete)
          ListTile(
            enabled: !state.isDeletingPost,
            title: const Text(
              '删除动态',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () => onDelete(),
          ),
        ],
      ),
    );
  }
}

const _visibilityOptions = [
  _VisibilityOption(PostVisibility.PUBLIC, '所有人可见'),
  _VisibilityOption(PostVisibility.FRIENDS_ONLY, '仅好友可见'),
  _VisibilityOption(PostVisibility.SQUARE_ONLY, '仅广场可见'),
  _VisibilityOption(PostVisibility.SELF_ONLY, '仅自己可见'),
];

class _VisibilityOption {
  const _VisibilityOption(this.visibility, this.label);

  final PostVisibility visibility;
  final String label;
}
