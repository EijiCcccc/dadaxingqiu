import 'package:core/core.dart';
import 'package:feature_profile/presentation/profile_user_display.dart';
import 'package:feature_profile/presentation/profile_tab/my_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

/// 主首页「我的」Tab
class ProfileTab extends ConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(myProfileProvider);

    return SafeArea(
      top: true,
      child: _buildContent(context, ref, s),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, MyProfileState s) {
    if (s.profile != null) {
      final profile = s.profile!;
      return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E8FF).withOpacity(0.8),
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFFE9D5FF).withOpacity(0.5),
                    ),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '我的',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF581C87),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _ProfileHeaderCard(profile: profile),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE9D5FF).withOpacity(0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      _ProfileMenuItem(
                        icon: Icons.edit,
                        label: '编辑资料',
                        onTap: () => GlobalRouter.instance
                            .push(const EditProfileRoute()),
                      ),
                      Divider(
                        height: 1,
                        color: const Color(0xFFF3E8FF).withOpacity(0.5),
                      ),
                      _ProfileMenuItem(
                        icon: Icons.settings,
                        label: '设置',
                        onTap: () =>
                            GlobalRouter.instance.push(const SettingsRoute()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    }
    if (s.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: AsyncLoadErrorBody(
        onRetry: () => ref.read(myProfileProvider.notifier).refresh(),
      ),
    );
  }
}

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = resolveProfileAvatarUrl(profile);
    final nickname = profile.nickname.isEmpty ? '未设置昵称' : profile.nickname;
    final genderLabel = genderLabelZh(profile.gender);
    final tags =
        profile.tags.map((t) => t.name).where((n) => n.isNotEmpty).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFFF3E8FF),
                backgroundImage:
                    avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                child: avatarUrl.isEmpty
                    ? const Icon(Icons.person,
                        size: 40, color: Color(0xFF9CA3AF))
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4ADE80), Color(0xFF10B981)],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                if (genderLabel.isNotEmpty)
                  Row(
                    children: [
                      Icon(
                        profile.gender == 2 ? Icons.female : Icons.male,
                        size: 16,
                        color: profile.gender == 2
                            ? const Color(0xFFEC4899)
                            : const Color(0xFF3B82F6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        genderLabel,
                        style: TextStyle(
                          fontSize: 14,
                          color: profile.gender == 2
                              ? Colors.pink.shade600
                              : Colors.blue.shade600,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                if (tags.isEmpty)
                  Text(
                    '暂无标签',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags
                        .map(
                          (tag) => TagPill(
                            label: tag,
                            style: TagPillStyle.profileHeaderCompact,
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F3FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: Colors.purple.shade600),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF111827),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
      onTap: onTap,
    );
  }
}
