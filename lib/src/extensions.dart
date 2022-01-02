part of katana_module;

extension ModuleBuildContextExtensions on BuildContext {
  /// Get the model adapter.
  ModelAdapter? get model {
    return AdapterScope.of(this)?.modelAdapter;
  }

  /// Get the adapter plugins.
  AdapterPlugins? get plugin {
    return AdapterScope.of(this)?.plugin;
  }

  /// Get the platform adapter.
  PlatformAdapter? get platform {
    return AdapterScope.of(this)?.platformAdapter;
  }

  /// Get the module role.
  List<RoleConfig> get roles {
    return RoleScope.of(this)?.roles ?? [];
  }

  /// Get the app module config.
  AppModule? get app {
    return AppScope.of(this)?.app;
  }
}

extension RoleConfigExtensions on RoleConfig {
  /// Searches for permissions to be included.
  bool containsPermission(String permission) {
    return permissions.contains(permission);
  }
}

extension NullableRoleConfigExtensions on RoleConfig? {
  /// Searches for permissions to be included.
  bool containsPermission(String permission) {
    if (this == null) {
      return false;
    }
    return this!.permissions.contains(permission);
  }
}
