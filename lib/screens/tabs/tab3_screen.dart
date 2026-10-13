import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  final List<String> _logs = [
    'System operational: All sensors calibrated',
    'Session initiated successfully',
    'Real-time streaming link active',
    'Cache synced with cloud endpoints',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Clarity'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: [
                Icon(Icons.hub_outlined, color: AppTheme.primaryColor, size: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dynamic Routing Engine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('Ultra-fast latency and distributed nodes', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Recent Activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ..._logs.map((log) => Card(
            color: AppTheme.surfaceColor,
            child: ListTile(
              leading: Icon(Icons.fiber_manual_record, size: 12, color: AppTheme.secondaryColor),
              title: Text(log, style: const TextStyle(fontSize: 13)),
              trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.white24),
              onTap: () => RoutingService.openRegistrationUrl(),
            ),
          )),
        ],
      ),
    );
  }
}
