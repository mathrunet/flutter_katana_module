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
    this.verifyAppReroute = false,
    this.rerouteConfig,
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
            ? routeSetting.merge(_convert(
                config.routeSettings,
                verifyAppReroute: config.verifyAppReroute,
                rerouteConfig: config.rerouteConfig,
              ))
            : routeSetting,
      ),
    );
  }

  static Map<String, RouteConfig>? _convert(
    Map<String, RouteConfig>? routeSettings, {
    bool verifyAppReroute = true,
    RerouteConfig? rerouteConfig,
  }) {
    if (routeSettings.isEmpty) {
      return routeSettings;
    }
    if (!verifyAppReroute && rerouteConfig == null) {
      return routeSettings;
    }

    final res = <String, RouteConfig>{};
    for (final tmp in routeSettings!.entries) {
      final reroute =
          Map<String, bool Function(BuildContext)>.from(tmp.value.reroute);
      if (rerouteConfig != null) {
        reroute.addAll(rerouteConfig.value);
      }
      if (verifyAppReroute) {
        final config = AppModule.registered?.rerouteConfig ??
            const LoginRequiredRerouteConfig();
        reroute.addAll(config.value);
      }
      res[tmp.key] = tmp.value.copyWith(reroute: reroute);
    }
    return res;
  }

  /// Page title.
  final String? title;

  /// Route settings.
  @mustCallSuper
  final Map<String, RouteConfig>? routeSettings;

  /// Module's permission.
  final Permission permission;

  /// If you want to validate the reroute setting of your application, use `true`.
  final bool verifyAppReroute;

  /// Reroute Config.
  ///
  /// If this setting exists even if [verifyAppReroute] is `false`,
  /// the reroute is verified.
  final RerouteConfig? rerouteConfig;
}

/// Mix-in to give to pages that require a reroute condition.
mixin VerifyAppReroutePageModuleMixin on PageModule {
  /// `true` if login is required to view the page.
  @override
  bool get verifyAppReroute => true;
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
