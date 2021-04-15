part of katana_module;

extension ModuleBuildContextExtensions on BuildContext {
  /// Get the module adapter.
  ModuleAdapter? get adapter {
    return ModuleAdapterScope.of(this).adapter;
  }
}
