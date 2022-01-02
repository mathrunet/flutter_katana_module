part of katana_module;

/// Page module for storing routing information.
///
/// It is possible to handle pages outside the module by putting your own page widgets etc. on the routing information.
@immutable
class RouteModule extends PageModule {
  /// Page module for storing routing information.
  ///
  /// It is possible to handle pages outside the module by putting your own page widgets etc. on the routing information.
  const RouteModule(
    Map<String, RouteConfig> routeSettings, {
    bool verifyAppReroute = false,
    List<RerouteConfig> rerouteConfigs = const [],
  }) : super(
          routeSettings: routeSettings,
          verifyAppReroute: verifyAppReroute,
          rerouteConfigs: rerouteConfigs,
        );
}
