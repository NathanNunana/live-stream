import 'package:aatv_mobile/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AaTV(),
    ),
  );
}

class AaTV extends StatelessWidget {
  const AaTV({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AATV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.registerRoutes,
      initialRoute: Routes.homeRoute,
    );
  }
}
