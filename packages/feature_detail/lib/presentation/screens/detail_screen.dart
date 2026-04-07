import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 详情页
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情 $id'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GlobalRouter.instance.pop(),
        ),
      ),
      body: Center(
        child: Text('Detail ID: $id'),
      ),
    );
  }
}
