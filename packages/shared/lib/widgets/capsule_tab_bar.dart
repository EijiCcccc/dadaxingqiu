import 'package:core/core.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';

class AppCapsuleTabBar extends StatelessWidget {
  const AppCapsuleTabBar({
    super.key,
    required this.controller,
    required this.labels,
    this.onTap,
  }) : assert(labels.length > 0);

  final TabController controller;
  final List<String> labels;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    assert(
      controller.length == labels.length,
      'TabController length must match labels length.',
    );

    // 构建 ExtendedTab 列表
    final extendedTabs = labels.map((label) {
      return ExtendedTab(
        text: label,
        scrollDirection: Axis.horizontal,
      );
    }).toList();

    return ExtendedTabBar(
      controller: controller,
      onTap: onTap,
      indicator: const ExtendedUnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: AppColors.primary,
        ),
        insets: EdgeInsets.only(bottom: 5),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      foregroundIndicator: true,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      tabs: extendedTabs,
    );
  }
}
