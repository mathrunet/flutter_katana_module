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

  static DateTimeFormConfig? _fromMap(DynamicMap map) {
    return DateTimeFormConfig(
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
      initialDate: map.get<String?>("initialDate", null),
      type: DateTimeFormConfigType.values.firstWhereOrNull((item) =>
              item.index ==
              map.get("dateTimeType", DateTimeFormConfigType.dateTime.index)) ??
          DateTimeFormConfigType.dateTime,
      startSelectingDate: map.get<String?>("startSelectingDate", null),
      endSelectingDate: map.get<String?>("endSelectingDate", null),
    );
  }

  /// Convert the form config to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": _type,
      "dateTimeType": type.index,
      "backgroundColor": backgroundColor.toMap(),
      "color": color.toMap(),
      if (initialDate.isNotEmpty) "initialDate": initialDate,
      if (startSelectingDate.isNotEmpty)
        "startSelectingDate": startSelectingDate,
      if (endSelectingDate.isNotEmpty) "endSelectingDate": endSelectingDate,
    };
  }
}
