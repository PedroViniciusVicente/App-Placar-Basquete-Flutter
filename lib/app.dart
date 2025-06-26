import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'telas/tela_principal.dart';
import 'l10n/app_localizations.dart';

class BasqueteFlutterApp extends StatelessWidget {
  const BasqueteFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
      home: const ScorePage(),
    );
  }
}
