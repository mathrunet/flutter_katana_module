part of katana_module;

/// Class for storing information for dynamic links.
abstract class DynamicLinksAdapter extends AdapterModule {
  const DynamicLinksAdapter();

  /// Initialization and listen links.
  Future<void> listen([void Function(Uri messaging)? onUpdate]);
}
