part of katana_module;

/// You can set up values and forms to be registered to Firestore etc.
@immutable
class VariableConfig {
  /// You can set up values and forms to be registered to Firestore etc.
  const VariableConfig({
    required this.id,
    required this.label,
    this.icon,
    this.required = false,
    this.form,
  });

  /// ID of variable.
  final String id;

  /// Label of variable.
  final String label;

  /// VariableIcon.
  final IconData? icon;

  /// `true` if the data is required.
  final bool required;

  /// Data for the form.
  final FormConfig? form;

  static VariableConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("id")) {
      return null;
    }
    return VariableConfig(
      id: map.get("id", uuid),
      label: map.get("name", ""),
      icon: map.getAsMap("icon").toIconData(),
      required: map.get("required", false),
      form: FormConfig._fromMap(map),
    );
  }

  /// Convert the role config to [DynamicMap].
  DynamicMap toMap() {
    return <String, dynamic>{
      "id": id,
      "required": required,
      "name": label,
      "icon": icon.toMap(),
      if (form != null) "form": form!.toMap(),
    };
  }
}
