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
    this.show = true,
    this.form,
  });

  /// VariableConfig definition of the name.
  static const VariableConfig name = VariableConfig(
    id: Const.name,
    label: "Name",
    required: true,
    form: TextFormConfig(),
  );

  /// VariableConfig definition of the text.
  static const VariableConfig text = VariableConfig(
    id: Const.text,
    label: "Text",
    form: TextFormConfig(maxLines: 5, minLines: 5),
  );

  /// VariableConfig definition of the gender.
  static const VariableConfig gender = VariableConfig(
    id: "gender",
    label: "gender",
    form: SelectFormConfig(
      items: {
        "male": "Male",
        "female": "Female",
        "other": "Others",
      },
      initialKey: "other",
    ),
  );

  /// VariableConfig definition of the age.
  static const VariableConfig ages = VariableConfig(
    id: "ages",
    label: "Ages",
    form: SelectFormConfig(
      items: {
        "teens": "10s",
        "twenties": "20s",
        "thirties": "30s",
        "forties": "40s",
        "fifties": "50s",
        "sixties": "60s",
      },
      initialKey: "twenties",
    ),
  );

  /// VariableConfig definition of the order.
  static const VariableConfig order = VariableConfig(
    id: "order",
    label: "Order",
    form: HiddenFormConfig(
      type: HiddenFormConfigType.initialOrder,
      applyOnUpdate: false,
    ),
  );

  /// VariableConfig definition of the created time.
  static const VariableConfig createdTime = VariableConfig(
    id: "createdTime",
    label: "Created time",
    form: HiddenFormConfig(
      type: HiddenFormConfigType.dateTimeNow,
      applyOnUpdate: false,
    ),
  );

  /// VariableConfig definition of the updated time.
  static const VariableConfig updatedTime = VariableConfig(
    id: "updatedTime",
    label: "Updated time",
    form: HiddenFormConfig(
      type: HiddenFormConfigType.dateTimeNow,
    ),
  );

  /// ID of variable.
  final String id;

  /// Label of variable.
  final String label;

  /// VariableIcon.
  final IconData? icon;

  /// `True` if the data is required.
  final bool required;

  /// `True` if data is to be displayed.
  final bool show;

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

  /// Create a new VariableConfig by passing a value.
  VariableConfig copyWith({
    String? id,
    String? label,
    IconData? icon,
    bool? required,
    bool? show,
    FormConfig? form,
  }) {
    return VariableConfig(
      id: id ?? this.id,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      required: required ?? this.required,
      show: show ?? this.show,
      form: form ?? this.form,
    );
  }

  /// The equality operator.
  ///
  /// The default behavior for all [Object]s is to return true if and only if this object and [other] are the same object.
  ///
  /// Override this method to specify a different equality relation on a class. The overriding method must still be an equivalence relation. That is, it must be:
  ///
  /// Total: It must return a boolean for all arguments. It should never throw.
  ///
  /// Reflexive: For all objects o, o == o must be true.
  ///
  /// Symmetric: For all objects o1 and o2, o1 == o2 and o2 == o1 must either both be true, or both be false.
  ///
  /// Transitive: For all objects o1, o2, and o3, if o1 == o2 and o2 == o3 are true, then o1 == o3 must be true.
  ///
  /// The method should also be consistent over time, so whether two objects are equal should only change if at least one of the objects was modified.
  ///
  /// If a subclass overrides the equality operator, it should override the [hashCode] method as well to maintain consistency.
  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) => hashCode == other.hashCode;

  /// The hash code for this object.
  ///
  /// A hash code is a single integer which represents the state of the object that affects [operator ==] comparisons.
  ///
  /// All objects have hash codes. The default hash code implemented by [Object] represents only the identity of the object,
  /// the same way as the default [operator ==] implementation only considers objects equal if they are identical (see [identityHashCode]).
  ///
  /// If [operator ==] is overridden to use the object state instead,
  /// the hash code must also be changed to represent that state,
  /// otherwise the object cannot be used in hash based data structures like the default [Set] and [Map] implementations.
  ///
  /// Hash codes must be the same for objects that are equal to each other according to [operator ==].
  /// The hash code of an object should only change if the object changes in a way that affects equality.
  /// There are no further requirements for the hash codes. They need not be consistent between executions of the same program and there are no distribution guarantees.
  ///
  /// Objects that are not equal are allowed to have the same hash code.
  /// It is even technically allowed that all instances have the same hash code,
  /// but if clashes happen too often, it may reduce the efficiency of hash-based data structures like [HashSet] or [HashMap].
  ///
  /// If a subclass overrides [hashCode],
  /// it should override the [operator ==] operator as well to maintain consistency.
  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      required.hashCode ^
      icon.hashCode ^
      form.hashCode;
}
