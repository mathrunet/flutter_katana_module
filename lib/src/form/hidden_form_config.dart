part of katana_module;

/// FormConfig for using Hidden.
@immutable
class HiddenFormConfig extends FormConfig {
  const HiddenFormConfig({
    this.type = HiddenFormConfigType.variable,
    this.value,
    this.applyOnUpdate = true,
  });

  final HiddenFormConfigType type;

  final Object? value;

  final bool applyOnUpdate;
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
