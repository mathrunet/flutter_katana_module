part of katana_module;

/// Base class for configuring the module for use.
///
/// `ThemeColor`, `WidgetTheme`, and `RouteConfig` are the main settings.
///
/// For `ThemeColor` and `WidgetTheme`, try to get the top level theme,
/// but for `RouteConfig`, try to get and pass the `RouteConfig` of all ModuleConfigs you have.
@immutable
abstract class ModuleConfig {
  const ModuleConfig({
    this.enabled = true,
    this.title,
    this.widgetTheme,
    this.themeColor,
    this.routeSettings,
    this.initialRoute,
    this.bootSettings,
    this.unknownSettings,
    this.permission = const PermissionConfig(),
  });

  static ModuleConfig? _merge(List<ModuleConfig> moduleConfigs) {
    if (moduleConfigs.isEmpty) {
      return null;
    }
    return _MergedModuleConfig(
      title: moduleConfigs
          .firstWhereOrNull((config) => config.enabled && config.title != null)
          ?.title,
      widgetTheme: moduleConfigs
          .firstWhereOrNull(
              (config) => config.enabled && config.widgetTheme != null)
          ?.widgetTheme,
      themeColor: moduleConfigs
          .firstWhereOrNull(
              (config) => config.enabled && config.themeColor != null)
          ?.themeColor,
      initialRoute: moduleConfigs
          .firstWhereOrNull(
              (config) => config.enabled && config.initialRoute != null)
          ?.initialRoute,
      bootSettings: moduleConfigs
          .firstWhereOrNull(
              (config) => config.enabled && config.bootSettings != null)
          ?.bootSettings,
      unknownSettings: moduleConfigs
          .firstWhereOrNull(
              (config) => config.enabled && config.unknownSettings != null)
          ?.unknownSettings,
      routeSettings: moduleConfigs.fold<Map<String, RouteConfig>>(
        {},
        (routeSetting, config) => config.enabled
            ? routeSetting.merge(config.routeSettings)
            : routeSetting,
      ),
    );
  }

  /// `true` if Module is enabled.
  final bool enabled;

  /// App title.
  final String? title;

  /// Module's `WidgetTheme`.
  final WidgetTheme? widgetTheme;

  /// Module's `ThemeColor`.
  final ThemeColor? themeColor;

  /// Route settings.
  @mustCallSuper
  final Map<String, RouteConfig>? routeSettings;

  /// Initial routing path.
  final String? initialRoute;

  /// Boot settings.
  final RouteConfig? bootSettings;

  /// Unknown page settings.
  final RouteConfig? unknownSettings;

  /// Module's permission.
  final PermissionConfig permission;
}

@immutable
class _MergedModuleConfig extends ModuleConfig {
  const _MergedModuleConfig({
    String? title,
    WidgetTheme? widgetTheme,
    ThemeColor? themeColor,
    Map<String, RouteConfig>? routeSettings,
    String? initialRoute,
    RouteConfig? bootSettings,
    RouteConfig? unknownSettings,
    PermissionConfig permission = const PermissionConfig(),
  }) : super(
          title: title,
          widgetTheme: widgetTheme,
          themeColor: themeColor,
          routeSettings: routeSettings,
          initialRoute: initialRoute,
          bootSettings: bootSettings,
          unknownSettings: unknownSettings,
          permission: permission,
        );
}
