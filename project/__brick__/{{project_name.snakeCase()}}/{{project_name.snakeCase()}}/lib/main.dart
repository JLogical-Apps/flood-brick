import 'dart:async';

import 'package:flood/flood.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/presentation/pages_pond_component.dart';
import 'package:{{project_name.snakeCase()}}/presentation/style.dart';
import 'package:{{project_name.snakeCase()}}_core/pond.dart';

// Whether to set up test data in the test suite.
const shouldAddTestData = true;

Future<void> main(List<String> args) async {
  await PondApp.run(
    appPondContextGetter: buildAppPondContext,
    loadingPage: StyledLoadingPage(),
    notFoundPage: StyledPage(
      body: Center(
        child: StyledText.twoXl('Not Found!'),
      ),
    ),
  );
}

Future<AppPondContext> buildAppPondContext() async {
  final corePondContext = await getCorePondContext(
    environmentConfig: EnvironmentConfig.static.flutterAssets(),
    loggerService: (corePondContext) => corePondContext.environment.isOnline
        ? LoggerService.static.console.withFileLogHistory(corePondContext.fileSystem.tempDirectory / 'logs')
        : LoggerService.static.console,
    repositoryImplementations: (corePondContext) => [
      FlutterFileRepositoryImplementation(),
    ],
  );

  final appPondContext = AppPondContext(corePondContext: corePondContext);
  await appPondContext.register(FloodAppComponent(style: style));
  await appPondContext.register(TestingSetupAppComponent(onSetup: () async {
    if (shouldAddTestData) {
      await _setupTesting(corePondContext);
    }
  }));
  await appPondContext.register(PagesAppPondComponent());

  return appPondContext;
}

Future<void> _setupTesting(CorePondContext corePondContext) async {
  // TODO Set up test data here.
}
