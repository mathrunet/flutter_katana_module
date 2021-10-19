part of katana_module;

/// Base class for all modules.
///
/// You can enable or disable the module by specifying [enabled].
///
/// The [id] is given to restore the same when the module is saved to the server.
@immutable
abstract class Module {
  const Module({
    this.id,
    this.enabled = true,
  });

  static final List<Module> _registeredModules = [];

  static T? _fromMap<T extends Module>(DynamicMap map) {
    if (map.isEmpty) {
      return null;
    }
    for (final module in _registeredModules) {
      final mod = module.fromMap(map);
      if (mod != null) {
        return mod as T;
      }
    }
    return null;
  }

  /// Register the [modules] to be used.
  static void registerModules(List<Module> modules) {
    for (final module in modules) {
      if (_registeredModules.contains(module)) {
        continue;
      }
      _registeredModules.add(module);
    }
  }

  /// ID of the module.
  final String? id;

  /// `true` if Module is enabled.
  final bool enabled;

  /// Module Type.
  String get type => runtimeType.toString();

  /// Convert the module information from [DynamicMap].
  Module? fromMap(DynamicMap map);

  /// Convert the module information to [DynamicMap].
  DynamicMap toMap();
}