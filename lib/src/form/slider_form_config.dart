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

  final double min;
  final double max;
  final int? divisions;

  final String? suffixLabel;

  final double? initialValue;

  final Color? backgroundColor;

  final Color? color;
}
