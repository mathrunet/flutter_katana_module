part of katana_module;

/// Config class for forms.
@immutable
abstract class FormConfig<T> {
  const FormConfig();
}

/// Builder to define the actual behavior of the form config.
///
/// Specify the type of value to be managed in [TVariable] and the type of FormConfig in [TForm].
@immutable
abstract class FormConfigBuilder<TVariable, TForm extends FormConfig> {
  const FormConfigBuilder();

  /// Checks if it is the specified form config.
  bool check(FormConfig? form) {
    return form is TForm;
  }

  /// Specifies a callback for just displaying the value.
  Iterable<Widget> view({
    required VariableConfig<TVariable> config,
    required TForm form,
    required BuildContext context,
    required WidgetRef ref,
    DynamicMap? data,
    bool onlyRequired = false,
  });

  /// Specifies the callback for displaying the form.
  Iterable<Widget> form({
    required VariableConfig<TVariable> config,
    required TForm form,
    required BuildContext context,
    required WidgetRef ref,
    DynamicMap? data,
    bool onlyRequired = false,
  });

  /// Callback to retrieve values when processing form content.
  dynamic value({
    required VariableConfig<TVariable> config,
    required BuildContext context,
    required WidgetRef ref,
    bool updated = true,
  });

  Iterable<Widget> _view({
    required VariableConfig config,
    required FormConfig? form,
    required BuildContext context,
    required WidgetRef ref,
    DynamicMap? data,
    bool onlyRequired = false,
  }) {
    if (form == null || !check(form)) {
      return [];
    }
    return view(
      config: config as VariableConfig<TVariable>,
      // ignore: cast_nullable_to_non_nullable
      form: form as TForm,
      context: context,
      ref: ref,
      data: data,
      onlyRequired: onlyRequired,
    );
  }

  Iterable<Widget> _form({
    required VariableConfig config,
    required FormConfig? form,
    required BuildContext context,
    required WidgetRef ref,
    DynamicMap? data,
    bool onlyRequired = false,
  }) {
    if (form == null || !check(form)) {
      return [];
    }
    return this.form(
      config: config as VariableConfig<TVariable>,
      // ignore: cast_nullable_to_non_nullable
      form: form as TForm,
      context: context,
      ref: ref,
      data: data,
      onlyRequired: onlyRequired,
    );
  }

  dynamic _value({
    required VariableConfig config,
    required BuildContext context,
    required WidgetRef ref,
    bool updated = true,
  }) {
    return value(
      config: config as VariableConfig<TVariable>,
      context: context,
      ref: ref,
      updated: updated,
    );
  }
}
