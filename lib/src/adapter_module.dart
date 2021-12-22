part of katana_module;

/// Base module for Adapter.
@immutable
abstract class AdapterModule extends Module implements ModuleHook {
  /// Base module for Adapter.
  const AdapterModule();

  /// Run it the first time the app is launched.
  @override
  @mustCallSuper
  Future<void> onInit(BuildContext context) => Future.value();

  /// Runs when restoring authentication.
  @override
  @mustCallSuper
  Future<void> onRestoreAuth(BuildContext context) => Future.value();

  /// Runs after authentication has taken place.
  ///
  /// It is also called after registration or login has been completed.
  @override
  @mustCallSuper
  Future<void> onAfterAuth(BuildContext context) => Future.value();

  /// It is executed after the boot process is finished and
  /// before transitioning to another page.
  @override
  @mustCallSuper
  Future<void> onBeforeFinishBoot(BuildContext context) => Future.value();
}
