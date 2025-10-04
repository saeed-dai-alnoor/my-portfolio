import 'package:flutter/material.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  final List<Map<String, dynamic>> skills = const [
    {'name': 'Flutter', 'level': 0.85, 'color': Colors.blue},
    {'name': 'Dart', 'level': 0.8, 'color': Colors.blueAccent},
    {'name': 'Node.js', 'level': 0.75, 'color': Colors.green},
    {'name': 'Firebase', 'level': 0.7, 'color': Colors.orange},
    {'name': 'MySQL', 'level': 0.65, 'color': Colors.teal},
    {'name': 'Git', 'level': 0.9, 'color': Colors.redAccent},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // عرض المهارات
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: skills
                    .map(
                      (skill) => _skillCard(
                        skill['name'],
                        skill['level'],
                        skill['color'],
                        isDesktop,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // كارد لكل مهارة مع LinearProgressIndicator
  Widget _skillCard(String name, double level, Color color, bool isDesktop) {
    return Container(
      width: isDesktop ? 280 : double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: level,
              minHeight: 12,
              backgroundColor: Colors.grey[300],
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text('${(level * 100).toInt()}%'),
        ],
      ),
    );
  }
}
