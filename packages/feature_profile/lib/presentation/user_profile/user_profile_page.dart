import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

/// 用户资料页 - 从星球/消息进入
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = _getUser(userId);

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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildUserInfo(user),
                      const SizedBox(height: 24),
                      _buildSection('个人标签', user.personalTags),
                      const SizedBox(height: 24),
                      _buildSection('Ta的标签', user.additionalTags),
                      const SizedBox(height: 24),
                      _buildActionButton(user.hasChattedBefore),
                    ],
                  ),
                ),
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
          bottom: BorderSide(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
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

  Widget _buildUserInfo(_UserData user) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(user.avatar),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    user.nickname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF581C87),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    user.gender == 'male' ? Icons.male : Icons.female,
                    size: 20,
                    color: user.gender == 'male'
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFFEC4899),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'ID: ${user.userId}',
                style: TextStyle(fontSize: 14, color: Colors.purple.shade600),
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

  Widget _buildActionButton(bool hasChattedBefore) {
    return FullWidthBottomActionBar(
      padding: EdgeInsets.zero,
      barDecoration: const BoxDecoration(color: Colors.transparent),
      onPressed: () => GlobalRouter.instance.push(ChatRoute(userId: userId)),
      label: hasChattedBefore ? '跟Ta聊天' : '打个招呼',
    );
  }

  _UserData _getUser(String id) {
    return _users[id] ?? _users['1']!;
  }
}

class _UserData {
  _UserData({
    required this.avatar,
    required this.nickname,
    required this.gender,
    required this.userId,
    required this.personalTags,
    required this.additionalTags,
    required this.hasChattedBefore,
  });

  final String avatar;
  final String nickname;
  final String gender;
  final String userId;
  final List<String> personalTags;
  final List<String> additionalTags;
  final bool hasChattedBefore;
}

final _users = <String, _UserData>{
  '1': _UserData(
    avatar:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop',
    nickname: '星辰漫步',
    gender: 'female',
    userId: '搭搭星球_12847563',
    personalTags: ['找聊天搭子', '找游戏搭子', '夜猫子', '旅行', '电影', '摄影'],
    additionalTags: ['温柔', '有趣', '爱笑'],
    hasChattedBefore: false,
  ),
  '2': _UserData(
    avatar:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
    nickname: '宇宙旅行者',
    gender: 'male',
    userId: '搭搭星球_87423156',
    personalTags: ['电影', '音乐', '美食', '咖啡'],
    additionalTags: [],
    hasChattedBefore: true,
  ),
  '3': _UserData(
    avatar:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop',
    nickname: '月光女神',
    gender: 'female',
    userId: '搭搭星球_93847261',
    personalTags: ['读书', '咖啡', '旅行', '摄影', '美食', '艺术'],
    additionalTags: ['文艺', '知性', '优雅'],
    hasChattedBefore: false,
  ),
};
