part of katana_module;

/// FormConfig for using Select/DropdownField.
@immutable
class MultipleSelectFormConfig extends FormConfig {
  const MultipleSelectFormConfig({
    required this.items,
    required this.initialKeys,
    this.backgroundColor,
    this.color,
  });
  final Map<String, String> items;

  final List<String> initialKeys;

  final Color? backgroundColor;

  final Color? color;
}
