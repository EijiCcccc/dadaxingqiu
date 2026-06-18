import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MessageTabHeader extends StatelessWidget {
  const MessageTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              '消息',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          IconButton(
            onPressed: () => GlobalRouter.instance.push(const ContactRoute()),
            icon: const Icon(
              Icons.contacts_outlined,
              color: AppColors.primaryDark,
            ),
            tooltip: '通讯录',
          ),
        ],
      ),
    );
  }
}
