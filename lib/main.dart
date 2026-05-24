import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/course/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return Scaffold(
            appBar: AppBar(title: const Text('Course Detail')),
            body: Center(child: Text('Course: $id')),
          );
        },
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

void main() {
  runApp(const ProviderScope(child: LearnHubApp()));
}

class LearnHubApp extends ConsumerWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'LearnHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
