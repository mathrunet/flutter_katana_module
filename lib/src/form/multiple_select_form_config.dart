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

  static const String _type = "multipleSelect";

  final Map<String, String> items;

  final List<String> initialKeys;

  final Color? backgroundColor;

  final Color? color;

  static MultipleSelectFormConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("items")) {
      return null;
    }
    final items = map
        .getAsMap("items")
        .map((key, value) => MapEntry(key, value.toString()));
    return MultipleSelectFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      initialKeys: map.getAsList("initialKeys"),
      items: items,
    );
  }

  /// Convert the form config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": _type,
      "backgroundColor": backgroundColor.toMap(),
      "color": color.toMap(),
      "items": items.cast<String, dynamic>(),
      "initialKeys": initialKeys,
    };
  }
}
