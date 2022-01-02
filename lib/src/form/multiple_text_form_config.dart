part of katana_module;

/// FormConfig for using multiple TextField List.
@immutable
class MultipleTextFormConfig extends FormConfig {
  const MultipleTextFormConfig({
    this.backgroundColor,
    this.obscureText = false,
    this.color,
    this.minLength,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.maxItems,
    this.keyboardType = TextInputType.url,
  });

  final int? maxItems;

  final Color? backgroundColor;

  final Color? color;

  final int? minLines;

  final int? maxLines;

  final TextInputType keyboardType;

  final int? minLength;

  final int? maxLength;

  final bool obscureText;
}
