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

  static const String _type = "select";

  final Map<String, String> items;

  final String initialKey;

  final Color? backgroundColor;

  final Color? color;

  static SelectFormConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("items")) {
      return null;
    }
    final items = map
        .getAsMap("items")
        .map((key, value) => MapEntry(key, value.toString()));
    return SelectFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      initialKey: map.get("initialKey", items.keys.firstOrNull ?? ""),
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
      "initialKey": initialKey,
    };
  }
}
