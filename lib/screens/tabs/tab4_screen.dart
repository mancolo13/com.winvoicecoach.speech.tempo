import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 44,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
              child: Icon(Icons.person, size: 48, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(height: 12),
          Center(child: Text('Win Member', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Center(child: Text('Active Pro Subscription', style: TextStyle(color: AppTheme.secondaryColor, fontSize: 13))),
          const SizedBox(height: 24),
          Card(
            color: AppTheme.surfaceColor,
            child: Column(
              children: [
                _tile(Icons.tune, 'System Preferences'),
                const Divider(height: 1, color: Colors.white12),
                _tile(Icons.security, 'Security & Encryption'),
                const Divider(height: 1, color: Colors.white12),
                _tile(Icons.help_outline, 'Help & Live Support'),
                const Divider(height: 1, color: Colors.white12),
                _tile(Icons.info_outline, 'About WinVoiceCoach v1.0.0'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => RoutingService.openRegistrationUrl(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('Upgrade Pro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData ic, String t) {
    return ListTile(
      leading: Icon(ic, color: Colors.white70),
      title: Text(t),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: () => RoutingService.openRegistrationUrl(),
    );
  }
}
