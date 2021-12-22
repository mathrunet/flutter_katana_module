part of katana_module;

/// FormConfig for using multiple TextField List.
@immutable
class MultipleTextFormConfig extends FormConfig {
  const MultipleTextFormConfig({
    this.backgroundColor,
    this.obscureText = false,
    this.color,
    this.minLength,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.maxItems,
    this.keyboardType = TextInputType.url,
  });

  static const String _type = "linkList";

  final int? maxItems;

  final Color? backgroundColor;

  final Color? color;

  final int? minLines;

  final int? maxLines;

  final TextInputType keyboardType;

  final int? minLength;

  final int? maxLength;

  final bool obscureText;

  static MultipleTextFormConfig? _fromMap(DynamicMap map) {
    return MultipleTextFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      minLength: map.get<int?>("minLength", null),
      maxLength: map.get<int?>("maxLength", null),
      keyboardType: TextInputType.values.firstWhereOrNull((element) =>
              element.index ==
              map.get("keyboardType", TextInputType.url.index)) ??
          TextInputType.url,
      maxItems: map.get<int?>("maxItems", null),
      minLines: map.get<int?>("minLines", null),
      maxLines: map.get<int?>("maxLines", null),
      obscureText: map.get("obscureText", false),
    );
  }

  /// Convert the form config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": _type,
      "backgroundColor": backgroundColor.toMap(),
      "color": color.toMap(),
      if (minLength != null) "minLength": minLength,
      if (maxLength != null) "maxLength": maxLength,
      if (maxItems != null) "maxItems": maxItems,
      "keyboardType": keyboardType.index,
      if (minLines != null) "minLines": minLines,
      if (maxLines != null) "maxLines": maxLines,
      "obscureText": obscureText,
    };
  }
}
