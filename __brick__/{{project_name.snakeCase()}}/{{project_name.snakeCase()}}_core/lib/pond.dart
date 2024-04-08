import 'dart:async';

import 'package:flood_core/flood_core.dart';

Future<CorePondContext> getCorePondContext({
  EnvironmentConfig? environmentConfig,
  FutureOr<List<CorePondComponent>> Function(CorePondContext context)? initialCoreComponents,
  List<RepositoryImplementation> Function(CorePondContext context)? repositoryImplementations,
  List<AuthServiceImplementation> Function(CorePondContext context)? authServiceImplementations,
  MessagingService? Function(CorePondContext context)? messagingService,
  LoggerService? Function(CorePondContext context)? loggerService,
  TaskRunner? Function(CorePondContext context)? taskRunner,
}) async {
  environmentConfig ??= EnvironmentConfig.static.environmentVariables();
  final corePondContext = CorePondContext();
  await corePondContext.register(FloodCoreComponent(
    environmentConfig: environmentConfig,
    initialCoreComponents: initialCoreComponents,
    repositoryImplementations: repositoryImplementations,
    authServiceImplementations: authServiceImplementations,
    actionWrapper: <P, R>(action) => action.log(context: corePondContext),
    authService: (context) => AuthService.static.adapting(memoryIsAdmin: true),
    taskRunner: taskRunner,
    loggerService: loggerService,
    messagingService: messagingService,
  ));

  // TODO Register repositories here.

  return corePondContext;
}

Future<CorePondContext> getTestingCorePondContext() async {
  final corePondContext = await getCorePondContext(
    environmentConfig: EnvironmentConfig.static.testing(),
  );

  await corePondContext
      .locate<AuthCoreComponent>()
      .signup(AuthCredentials.email(email: 'asdf@asdf.com', password: 'mypassword'));

  return corePondContext;
}
