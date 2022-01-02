part of katana_module;

/// Config class for forms.
@immutable
abstract class FormConfig {
  const FormConfig();

  static FormConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("type")) {
      return null;
    }
    switch (map.get("type", "")) {
      case TextFormConfig._type:
        return TextFormConfig._fromMap(map);
      case SelectFormConfig._type:
        return SelectFormConfig._fromMap(map);
      case MultipleSelectFormConfig._type:
        return MultipleSelectFormConfig._fromMap(map);
      case DateTimeFormConfig._type:
        return DateTimeFormConfig._fromMap(map);
      case MultipleTextFormConfig._type:
        return MultipleTextFormConfig._fromMap(map);
      case SliderFormConfig._type:
        return SliderFormConfig._fromMap(map);
      case HiddenFormConfig._type:
        return HiddenFormConfig._fromMap(map);
    }
  }

  /// Convert the form config to [DynamicMap].
  DynamicMap toMap();
}
