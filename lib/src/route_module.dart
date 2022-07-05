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
    Map<String, Widget> routeSettings, {
    bool enabled = true,
    bool verifyAppReroute = true,
    List<RerouteConfig> rerouteConfigs = const [],
  })  : _routeSettings = routeSettings,
        super(
          enabled: enabled,
          verifyAppReroute: verifyAppReroute,
          rerouteConfigs: rerouteConfigs,
        );

  final Map<String, Widget> _routeSettings;

  @override
  Map<String, RouteConfig> get routeSettings {
    if (!enabled) {
      return const {};
    }
    return _routeSettings.map<String, RouteConfig>((key, value) {
      return MapEntry(key, RouteConfig((_) => value));
    });
  }
}
