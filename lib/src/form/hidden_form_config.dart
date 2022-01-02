part of katana_module;

/// FormConfig for using Hidden.
@immutable
class HiddenFormConfig extends FormConfig {
  const HiddenFormConfig({
    this.type = HiddenFormConfigType.variable,
    this.value,
    this.applyOnUpdate = true,
  });

  static const String _type = "hidden";

  final HiddenFormConfigType type;

  final Object? value;

  final bool applyOnUpdate;

  static HiddenFormConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("hiddenType")) {
      return null;
    }
    return HiddenFormConfig(
      type: HiddenFormConfigType.values.firstWhereOrNull((item) =>
              item.index ==
              map.get("hiddenType", HiddenFormConfigType.variable.index)) ??
          HiddenFormConfigType.variable,
      value: map.get<Object?>("value", null),
      applyOnUpdate: map.get("applyOnUpdate", true),
    );
  }

  /// Convert the form config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": _type,
      "hiddenType": type.index,
      "applyOnUpdate": applyOnUpdate,
      if (value != null) "value": value,
    };
  }
}

/// The type of Hidden form config.
enum HiddenFormConfigType {
  /// Value.
  variable,

  /// Current time.
  dateTimeNow,

  /// Initial Order.
  initialOrder,
}
