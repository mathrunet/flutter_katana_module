part of katana_module;

/// Module for pages.
///
/// You can specify [title], [routeSettings], and [permission],
/// and you can create a module that can do basic page transitions.
@immutable
abstract class PageModule extends Module implements ModuleHook {
  /// Module for pages.
  ///
  /// You can specify [title], [routeSettings], and [permission],
  /// and you can create a module that can do basic page transitions.
  const PageModule({
    String? id,
    bool enabled = true,
    this.title,
    this.routeSettings = const {},
    this.permission = const Permission(),
    this.verifyAppReroute = false,
    this.rerouteConfigs = const [],
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
        (routeSetting, module) => module.enabled
            ? routeSetting.merge(_convert(
                module,
                module.routeSettings,
                verifyAppReroute: module.verifyAppReroute,
                rerouteConfigs: module.rerouteConfigs,
              ))
            : routeSetting,
      ),
      rerouteConfigs: pageModules.expand((e) {
        return e.rerouteConfigs;
      }).distinct(),
    );
  }

  static Map<String, RouteConfig>? _convert(
    PageModule module,
    Map<String, RouteConfig>? routeSettings, {
    bool verifyAppReroute = true,
    List<RerouteConfig> rerouteConfigs = const [],
  }) {
    if (routeSettings.isEmpty) {
      return routeSettings;
    }
    final routes = routeSettings!.map<String, RouteConfig>((key, value) {
      return MapEntry(
        key,
        RouteConfig(
          (context) => PageModuleScope(
            child: value.builder.call(context),
            module: module,
          ),
        ),
      );
    });
    if (!verifyAppReroute && rerouteConfigs.isEmpty) {
      return routes;
    }

    final res = <String, RouteConfig>{};
    for (final tmp in routes.entries) {
      final reroute =
          Map<String, bool Function(BuildContext)>.from(tmp.value.reroute);
      if (rerouteConfigs.isNotEmpty) {
        rerouteConfigs.forEach((e) => reroute.addAll(e.value));
      }
      if (verifyAppReroute) {
        if (AppModule.registered != null &&
            AppModule.registered!.rerouteConfigs.isNotEmpty) {
          AppModule.registered!.rerouteConfigs
              .forEach((e) => reroute.addAll(e.value));
        } else {
          reroute.addAll(const LoginRequiredRerouteConfig().value);
        }
      }
      res[tmp.key] = tmp.value.copyWith(reroute: reroute);
    }
    return res;
  }

  /// Page title.
  final String? title;

  /// Route settings.
  @mustCallSuper
  final Map<String, RouteConfig> routeSettings;

  /// Module's permission.
  final Permission permission;

  /// If you want to validate the reroute setting of your application, use `true`.
  final bool verifyAppReroute;

  /// Reroute Config.
  ///
  /// If this setting exists even if [verifyAppReroute] is `false`,
  /// the reroute is verified.
  @mustCallSuper
  final List<RerouteConfig> rerouteConfigs;

  /// Run it the first time the app is launched.
  @override
  @mustCallSuper
  Future<void> onInit(BuildContext context) async {
    await Future.wait(rerouteConfigs.map((e) => e.onInit(context)));
  }

  /// Runs when restoring authentication.
  @override
  @mustCallSuper
  Future<void> onRestoreAuth(BuildContext context) async {
    await Future.wait(rerouteConfigs.map((e) => e.onRestoreAuth(context)));
  }

  /// Runs after authentication has taken place.
  ///
  /// It is also called after registration or login has been completed.
  @override
  @mustCallSuper
  Future<void> onAfterAuth(BuildContext context) async {
    await Future.wait(rerouteConfigs.map((e) => e.onAfterAuth(context)));
  }

  /// It is executed after the boot process is finished and
  /// before transitioning to another page.
  @override
  @mustCallSuper
  Future<void> onBeforeFinishBoot(BuildContext context) async {
    await Future.wait(rerouteConfigs.map((e) => e.onBeforeFinishBoot(context)));
  }

  /// It is executed after the boot process is finished and
  /// after transitioning to another page.
  @override
  @mustCallSuper
  Future<void> onAfterFinishBoot(BuildContext context) async {
    await Future.wait(rerouteConfigs.map((e) => e.onAfterFinishBoot(context)));
  }
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
    Map<String, RouteConfig> routeSettings = const {},
    List<RerouteConfig> rerouteConfigs = const [],
  }) : super(
          title: title,
          routeSettings: routeSettings,
          rerouteConfigs: rerouteConfigs,
        );

  @override
  String get type => throw UnimplementedError();
}
