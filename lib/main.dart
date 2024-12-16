import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:share_your_tale/features/app/app_dependencies.dart';
import 'package:share_your_tale/features/app/presentation/app.dart';

void main() async {
  final (:graphqlClient) = _initGraphqlClient();
  final dependencies = AppDependencies(
    graphQLClient: graphqlClient,
    dio: Dio(),
  );

  runApp(
    App(
      dependencies: dependencies,
      builder: (context, child) {
        return child!;
      },
    ),
  );
}

({GraphQLClient graphqlClient}) _initGraphqlClient() {
  final httpLink = HttpLink('https://mock.com/graphql');

  final link = Link.from([
    httpLink,
  ]);

  final policies = Policies(
    fetch: FetchPolicy.networkOnly,
  );

  final graphqlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(
      watchQuery: policies,
      query: policies,
      mutate: policies,
    ),
  );

  return (graphqlClient: graphqlClient,);
}
