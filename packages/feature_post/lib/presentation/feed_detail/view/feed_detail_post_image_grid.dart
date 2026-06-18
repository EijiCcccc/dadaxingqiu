import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

class FeedDetailPostImageGrid extends StatelessWidget {
  const FeedDetailPostImageGrid({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<PostImage> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final image = images[index];
        final imageUrl =
            image.thumbUrl.isNotEmpty ? image.thumbUrl : image.imageUrl;
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AppNetworkImage(url: imageUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}
