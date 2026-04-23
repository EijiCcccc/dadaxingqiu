import 'package:core/core.dart';
import 'package:feature_profile/presentation/user_profile/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

/// 用户资料页 - 从星球/消息进入
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProfileProvider(userId));

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E8FF),
              Color(0xFFFDF2F8),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: _buildBody(state, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF).withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFE9D5FF).withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => GlobalRouter.instance.pop(),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF581C87)),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(UserProfileState state, WidgetRef ref) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return AsyncLoadErrorBody(
        onRetry: () => ref.read(userProfileProvider(userId).notifier).refresh(),
      );
    }
    if (!state.hasData) {
      return const Center(child: Text('暂无数据'));
    }

    final summary = state.summary!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildUserInfo(summary),
          const SizedBox(height: 24),
          _buildSection('个人标签', summary.tags.map((t) => t.name).toList()),
          const SizedBox(height: 24),
          _buildActionButton(),
        ],
      ),
    );
  }

  Widget _buildUserInfo(OtherUserSummary summary) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: summary.avatarUrl.isNotEmpty
              ? NetworkImage(summary.avatarUrl)
              : null,
          backgroundColor: const Color(0xFFF3E8FF),
          child: summary.avatarUrl.isEmpty
              ? const Icon(Icons.person, size: 32, color: Color(0xFF9CA3AF))
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    summary.nickname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF581C87),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    summary.gender == 2 ? Icons.female : Icons.male,
                    size: 20,
                    color: summary.gender == 2
                        ? const Color(0xFFEC4899)
                        : const Color(0xFF3B82F6),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'ID: ${summary.id}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<String> tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF581C87),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE9D5FF)),
          ),
          child: tags.isEmpty
              ? const Center(
                  child: Text(
                    'Ta还没有标签哦',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFA855F7),
                    ),
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map(
                        (tag) => TagPill(
                          label: tag,
                          style: TagPillStyle.profileSection,
                        ),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return FullWidthBottomActionBar(
      padding: EdgeInsets.zero,
      barDecoration: const BoxDecoration(color: Colors.transparent),
      onPressed: () => GlobalRouter.instance.push(ChatRoute(userId: userId)),
      label: '跟Ta聊天',
    );
  }
}
