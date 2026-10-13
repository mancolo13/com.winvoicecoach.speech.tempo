import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _score = 92;
  bool _active = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Pacer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor.withValues(alpha: 0.3), AppTheme.surfaceColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.4)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pacer Health', style: const TextStyle(fontSize: 16, color: Colors.white70)),
                    Switch(
                      value: _active,
                      activeThumbColor: AppTheme.primaryColor,
                      onChanged: (v) => setState(() => _active = v),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text('$_score%', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.92,
                  backgroundColor: Colors.white12,
                  color: AppTheme.primaryColor,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildMetric('Total', '1,840', Icons.analytics)),
              const SizedBox(width: 12),
              Expanded(child: _buildMetric('Active', '99.2%', Icons.speed)),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(3, (i) => Card(
            color: AppTheme.surfaceColor,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                child: Icon(Icons.check, color: AppTheme.primaryColor),
              ),
              title: Text('Pacer Priority ${i + 1}'),
              subtitle: Text('Progress: Normal • Level ${i + 1}'),
              trailing: const Icon(Icons.chevron_right, color: Colors.white38),
              onTap: () => setState(() => _score = (_score + 1) % 100),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildMetric(String t, String v, IconData ic) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ic, color: AppTheme.secondaryColor, size: 28),
          const SizedBox(height: 8),
          Text(t, style: const TextStyle(color: Colors.white60, fontSize: 13)),
          Text(v, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
