part of katana_module;

/// Abstract class for defining the behavior hooks of a module.
abstract class ModuleHook {
  /// Run it the first time the app is launched.
  @mustCallSuper
  Future<void> onInit(BuildContext context);

  /// Runs when restoring authentication.
  @mustCallSuper
  Future<void> onRestoreAuth(BuildContext context);

  /// Runs after authentication has taken place.
  ///
  /// It is also called after registration or login has been completed.
  @mustCallSuper
  Future<void> onAfterAuth(BuildContext context);

  /// It is executed after the boot process is finished and
  /// before transitioning to another page.
  @mustCallSuper
  Future<void> onBeforeFinishBoot(BuildContext context);
}
