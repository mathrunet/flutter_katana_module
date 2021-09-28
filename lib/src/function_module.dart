part of katana_module;

/// Module that can define callbacks, etc.
///
/// Basically, it cannot be serialized.
@immutable
abstract class FunctionModule extends Module {
  /// Module that can define callbacks, etc.
  ///
  /// Basically, it cannot be serialized.
  const FunctionModule();

  /// Convert the function module information from [DynamicMap].
  @override
  FunctionModule? fromMap(DynamicMap map) {
    return null;
  }

  /// Convert the function module information to [DynamicMap].
  @override
  DynamicMap toMap() {
    return {};
  }
}
