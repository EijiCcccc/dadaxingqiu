import 'package:flutter/material.dart';

class FeedDetailEmojiPanel extends StatelessWidget {
  const FeedDetailEmojiPanel({
    Key? key,
    required this.emojis,
    required this.onSelect,
  }) : super(key: key);

  final List<String> emojis;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 168,
        child: GridView.builder(
          itemCount: emojis.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final emoji = emojis[index];
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => onSelect(emoji),
              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
