part of katana_module;

/// FormConfig for using TextField.
@immutable
class TextFormConfig extends FormConfig {
  const TextFormConfig({
    this.color,
    this.backgroundColor,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.minLength,
    this.maxLength,
    this.keyboardType = TextInputType.text,
  });

  static const String _type = "text";

  final Color? backgroundColor;

  final Color? color;

  final int? minLines;

  final int? maxLines;

  final TextInputType keyboardType;

  final int? minLength;

  final int? maxLength;

  final bool obscureText;

  static TextFormConfig? _fromMap(DynamicMap map) {
    return TextFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      keyboardType: TextInputType.values.firstWhereOrNull((element) =>
              element.index ==
              map.get("keyboardType", TextInputType.text.index)) ??
          TextInputType.text,
      minLines: map.get<int?>("minLines", null),
      maxLines: map.get<int?>("maxLines", null),
      minLength: map.get<int?>("minLength", null),
      maxLength: map.get<int?>("maxLength", null),
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
      "keyboardType": keyboardType.index,
      if (minLines != null) "minLines": minLines,
      if (maxLines != null) "maxLines": maxLines,
      if (minLength != null) "minLength": minLength,
      if (maxLength != null) "maxLength": maxLength,
      "obscureText": obscureText,
    };
  }
}
