part of katana_module;

/// Defines a module group.
///
/// If you include page modules, etc. in [modules],
/// they will all be expanded and loaded.
///
/// You can also include [GroupModule] in [modules].
@immutable
abstract class GroupModule extends Module implements ModuleHook {
  /// Defines a module group.
  ///
  /// If you include page modules, etc. in [modules],
  /// they will all be expanded and loaded.
  ///
  /// You can also include [GroupModule] in [modules].
  const GroupModule({
    String? id,
    bool enabled = true,
  }) : super(
          id: id,
          enabled: enabled,
        );

  /// List of modules that are grouped.
  List<Module> get modules;

  static List<Module> _extractModules(List<Module> modules) {
    final res = <Module>[];
    for (final module in modules) {
      if (module is GroupModule) {
        final mods = GroupModule._extractModules(module.modules);
        res.addAll(mods);
      } else {
        res.add(module);
      }
    }
    return res;
  }

  /// Runs after authentication has taken place.
  ///
  /// It is also called after registration or login has been completed.
  @override
  Future<void> onAfterAuth(BuildContext context) => Future.value();

  /// It is executed after the boot process is finished and before transitioning to another page.
  @override
  Future<void> onBeforeFinishBoot(BuildContext context) => Future.value();

  /// Run it the first time the app is launched.
  @override
  Future<void> onInit(BuildContext context) => Future.value();

  /// Runs when restoring authentication.
  @override
  Future<void> onRestoreAuth(BuildContext context) => Future.value();
}
