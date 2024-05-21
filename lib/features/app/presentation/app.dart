import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_your_tale/core/routes/router.dart';
import 'package:share_your_tale/features/app/app_dependencies.dart';
import 'package:share_your_tale/ui/core/share_your_tales_app.dart';

class App extends StatefulWidget {
  const App({required this.dependencies, super.key, this.builder});

  final AppDependencies dependencies;
  final TransitionBuilder? builder;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter routerConfig;

  @override
  void initState() {
    super.initState();

    routerConfig = getGoRouterConfig();
  }

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
        dependencies: widget.dependencies,
        child: ShareYourTaleApp(
          title: 'Share Your Tale',
          routerConfig: routerConfig,
          builder: widget.builder,
        ));
  }
}
