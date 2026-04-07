import 'package:core/core.dart';
import 'package:feature_profile/presentation/edit_tags/edit_tags_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

class EditTagsPage extends ConsumerWidget {
  const EditTagsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(editTagsBootstrapProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: async.when(
          data: (data) => _EditTagsLoaded(
            catalog: data.catalog,
            profile: data.profile,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: AsyncLoadErrorBody(
              onRetry: () => ref.invalidate(editTagsBootstrapProvider),
            ),
          ),
        ),
      ),
    );
  }
}

class _EditTagsLoaded extends ConsumerWidget {
  const _EditTagsLoaded({
    required this.catalog,
    required this.profile,
  });

  final GetTagsResponse catalog;
  final UserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileId = profile.id;
    final st = ref.watch(editTagsProvider(profileId));
    final notifier = ref.read(editTagsProvider(profileId).notifier);
    final groups = catalog.groups;

    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: groups.isEmpty
              ? Center(
                  child: Text(
                    '暂无可用标签',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groups.map((g) {
                      final title = g.title.isNotEmpty ? g.title : g.type;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: g.items.map((tag) {
                                final selected =
                                    st.selectedIds.contains(tag.id);
                                final label = tag.name.isNotEmpty
                                    ? tag.name
                                    : '#${tag.id}';
                                return SelectableTagChip(
                                  label: label,
                                  selected: selected,
                                  onTap: () => notifier.toggle(tag.id),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
        FullWidthBottomActionBar(
          loading: st.saving,
          onPressed: notifier.confirm,
          label: '确认',
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white.withOpacity(0.8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => GlobalRouter.instance.pop(),
              icon: const Icon(Icons.arrow_back, color: Color(0xFF111827)),
            ),
          ),
          const Text(
            '编辑个人标签',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }
}
