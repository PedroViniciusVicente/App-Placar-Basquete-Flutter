import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../componentes/coluna_time.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int _scoreTeam1 = 0;
  int _scoreTeam2 = 0;

  Map<String, int>? _lastPlay;

  void _addPoints(int team, int points) {
    setState(() {
      if (team == 1) {
        _scoreTeam1 += points;
      } else {
        _scoreTeam2 += points;
      }
      _lastPlay = {"team": team, "points": points};
    });
  }

  void _undoLastPlay() {
    if (_lastPlay != null) {
      setState(() {
        int team = _lastPlay!["team"]!;
        int points = _lastPlay!["points"]!;
        if (team == 1) {
          _scoreTeam1 -= points;
        } else {
          _scoreTeam2 -= points;
        }
        _lastPlay = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              TeamColumn(
                label: loc.team1,
                score: _scoreTeam1,
                onAddPoint: (points) => _addPoints(1, points),
              ),
              TeamColumn(
                label: loc.team2,
                score: _scoreTeam2,
                onAddPoint: (points) => _addPoints(2, points),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _lastPlay == null ? null : _undoLastPlay,
            child: Text(loc.undo),
          ),
        ],
      ),
    );
  }
}
