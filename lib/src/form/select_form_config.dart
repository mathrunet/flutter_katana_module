part of katana_module;

/// FormConfig for using Select/DropdownField.
@immutable
class SelectFormConfig extends FormConfig {
  const SelectFormConfig({
    required this.items,
    required this.initialKey,
    this.backgroundColor,
    this.color,
  });

  final Map<String, String> items;

  final String initialKey;

  final Color? backgroundColor;

  final Color? color;
}
