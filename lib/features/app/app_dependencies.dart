import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:share_your_tale/core/utils/extensions/context_extension.dart';
// import 'package:pruv_mobile/core/utils/fresh_link.dart';
// import 'package:shared_preferences/shared_preferences.dart';

@immutable
class AppDependencies {
  const AppDependencies({
    required this.graphQLClient,
    required this.dio,
    // required this.keyStorage,
  });

  final GraphQLClient graphQLClient;
  final Dio dio;
  // final SharedPreferences keyStorage;
}

class AppDependenciesScope extends InheritedWidget {
  const AppDependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final AppDependencies dependencies;

  static AppDependencies of(
    BuildContext context,
  ) {
    return context.inhOf<AppDependenciesScope>(listen: false).dependencies;
  }

  @override
  bool updateShouldNotify(covariant AppDependenciesScope oldWidget) => false;
}
