part of katana_module;

/// Type of form.
enum DateTimeFormConfigType {
  /// Date only.
  date,

  /// Time only.
  time,

  /// Date and time.
  dateTime,
}

/// FormConfig for using date time field.
@immutable
class DateTimeFormConfig extends FormConfig {
  const DateTimeFormConfig({
    this.backgroundColor,
    this.initialDate,
    this.color,
    this.type = DateTimeFormConfigType.dateTime,
    this.startSelectingDate,
    this.endSelectingDate,
  });

  static const String _type = "dateTime";

  final String? initialDate;

  final DateTimeFormConfigType type;

  final Color? backgroundColor;

  final Color? color;

  final String? startSelectingDate;

  final String? endSelectingDate;
}
