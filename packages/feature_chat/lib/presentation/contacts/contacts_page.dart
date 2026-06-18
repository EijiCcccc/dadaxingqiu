import 'package:core/core.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import 'contact_list_provider.dart';
import 'view/contact_list_item.dart';

class ContactsPage extends ConsumerStatefulWidget {
  const ContactsPage({super.key});

  @override
  ConsumerState<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends ConsumerState<ContactsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = [
    ContactListType.friends,
    ContactListType.following,
    ContactListType.followers,
  ];

  static const _labels = ['好友', '关注', '粉丝'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              _ContactsAppBar(onBack: () => GlobalRouter.instance.pop()),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: AppCapsuleTabBar(
                  controller: _tabController,
                  labels: _labels,
                ),
              ),
              Expanded(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  cacheExtent: 2,
                  shouldIgnorePointerWhenScrolling: false,
                  children: [
                    for (final type in _tabs)
                      _ContactListTab(
                        type: type,
                        showIntimacy: type != ContactListType.following,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactsAppBar extends StatelessWidget {
  const _ContactsAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
          ),
          const Expanded(
            child: Text(
              '通讯录',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _ContactListTab extends ConsumerWidget {
  const _ContactListTab({
    required this.type,
    required this.showIntimacy,
  });

  final ContactListType type;
  final bool showIntimacy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(contactListProvider(type));

    return listAsync.when(
      data: (state) => RefreshIndicator(
        onRefresh: () => ref.read(contactListProvider(type).notifier).refresh(),
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis != Axis.vertical) return false;
            if (notification.metrics.maxScrollExtent <= 0) return false;
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 180) {
              ref.read(contactListProvider(type).notifier).loadMore();
            }
            return false;
          },
          child: state.items.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      child: Center(
                        child: Text(
                          _emptyLabel(type),
                          style: const TextStyle(color: AppColors.textMuted),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: AppColors.bgPurple100.withOpacity(0.5),
                  ),
                  itemBuilder: (context, index) {
                    if (index >= state.items.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final item = state.items[index];
                    return ContactListItem(
                      item: item,
                      showIntimacy: showIntimacy,
                      onTap: () => GlobalRouter.instance.push(
                        UserProfileRoute(userId: item.userId),
                      ),
                    );
                  },
                ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: AsyncLoadErrorBody(
          message: '通讯录加载失败：$error',
          onRetry: () => ref.invalidate(contactListProvider(type)),
          padding: const EdgeInsets.all(24),
        ),
      ),
    );
  }

  String _emptyLabel(ContactListType type) {
    switch (type) {
      case ContactListType.friends:
        return '暂无好友';
      case ContactListType.following:
        return '暂无关注';
      case ContactListType.followers:
        return '暂无粉丝';
    }
  }
}
