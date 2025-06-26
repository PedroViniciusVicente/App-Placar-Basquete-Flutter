import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';


class TeamColumn extends StatelessWidget {
  final String label;
  final int score;
  final void Function(int) onAddPoint;

  const TeamColumn({
    super.key,
    required this.label,
    required this.score,
    required this.onAddPoint,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 24)),
          Text('$score', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onAddPoint(1),
            child: Text(loc.freeThrow),
          ),
          ElevatedButton(
            onPressed: () => onAddPoint(2),
            child: Text(loc.twoPoints),
          ),
          ElevatedButton(
            onPressed: () => onAddPoint(3),
            child: Text(loc.threePoints),
          ),
        ],
      ),
    );
  }
}
