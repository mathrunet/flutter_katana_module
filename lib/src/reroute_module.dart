part of katana_module;

/// Page module for rerouting.
///
/// When accessing [routePath], [rerouteConfigs] will take the user to a different page.
///
/// Use it for access destination changes due to roles, etc.
@immutable
class RerouteModule extends PageModule {
  /// Page module for rerouting.
  ///
  /// When accessing [routePath], [rerouteConfigs] will take the user to a different page.
  ///
  /// Use it for access destination changes due to roles, etc.
  const RerouteModule(
    this.routePath,
    List<RerouteConfig> rerouteConfigs, {
    bool enabled = true,
  }) : super(
          enabled: enabled,
          verifyAppReroute: false,
          rerouteConfigs: rerouteConfigs,
        );

  /// Root path to be monitored.
  @override
  // ignore: overridden_fields
  final String routePath;

  @override
  Map<String, RouteConfig> get routeSettings {
    if (!enabled) {
      return const {};
    }
    return {
      "/$routePath": RouteConfig((_) => const SizedBox()),
    };
  }
}
