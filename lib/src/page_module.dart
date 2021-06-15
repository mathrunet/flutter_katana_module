part of katana_module;

/// Module for pages.
///
/// You can specify [title], [routeSettings], and [permission],
/// and you can create a module that can do basic page transitions.
@immutable
abstract class PageModule extends Module {
  /// Module for pages.
  ///
  /// You can specify [title], [routeSettings], and [permission],
  /// and you can create a module that can do basic page transitions.
  const PageModule({
    String? id,
    bool enabled = true,
    this.title,
    this.routeSettings,
    this.permission = const Permission(),
  }) : super(
          id: id,
          enabled: enabled,
        );

  /// Merge all [modules] into a single page module configuration.
  static PageModule? merge(List<Module> modules) {
    if (modules.isEmpty) {
      return null;
    }
    final pageModules = modules.whereType<PageModule>();
    return _MergedPageModule(
      title: pageModules
          .firstWhereOrNull((config) => config.enabled && config.title != null)
          ?.title,
      routeSettings: pageModules.fold<Map<String, RouteConfig>>(
        {},
        (routeSetting, config) => config.enabled
            ? routeSetting.merge(config.routeSettings)
            : routeSetting,
      ),
    );
  }

  /// Page title.
  final String? title;

  /// Route settings.
  @mustCallSuper
  final Map<String, RouteConfig>? routeSettings;

  /// Module's permission.
  final Permission permission;
}

@immutable
class _MergedPageModule extends PageModule {
  const _MergedPageModule({
    String? title,
    Map<String, RouteConfig>? routeSettings,
  }) : super(
          title: title,
          routeSettings: routeSettings,
        );

  @override
  DynamicMap toMap() {
    throw UnimplementedError();
  }

  @override
  Module? fromMap(DynamicMap map) {
    throw UnimplementedError();
  }

  @override
  String get type => throw UnimplementedError();
}
