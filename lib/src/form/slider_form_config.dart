part of katana_module;

/// FormConfig for using Slider.
@immutable
class SliderFormConfig extends FormConfig {
  const SliderFormConfig({
    required this.min,
    required this.max,
    this.divisions,
    this.initialValue,
    this.backgroundColor,
    this.color,
    this.suffixLabel,
  });

  static const String _type = "slider";
  final double min;
  final double max;
  final int? divisions;

  final String? suffixLabel;

  final double? initialValue;

  final Color? backgroundColor;

  final Color? color;

  static SliderFormConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("min") || !map.containsKey("max")) {
      return null;
    }
    final min = map.get("min", 0.0);
    return SliderFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      min: min,
      max: map.get("max", 0.0),
      divisions: map.get<int?>("divisions", null),
      initialValue: map.get("initialValue", min),
      suffixLabel: map.get("suffix", nullOfString),
    );
  }

  /// Convert the form config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": _type,
      "backgroundColor": backgroundColor.toMap(),
      "color": color.toMap(),
      "min": min,
      "max": max,
      "divisions": divisions,
      "initialValue": initialValue,
    };
  }
}
