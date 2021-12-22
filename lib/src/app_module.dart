part of katana_module;

/// Module for configuring the entire application.
@immutable
class AppModule extends Module implements ModuleHook {
  /// Module for configuring the entire application.
  const AppModule({
    required this.title,
    this.logoUrl,
    this.initialRoute = "/",
    this.officialUrl,
    this.supportUrl,
    this.privacyPolicyUrl,
    this.termsUrl,
    this.menus = const [],
    this.roles = const [],
    this.lightTheme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.initialPageTransition = PageTransition.fade,
    this.designType = DesignType.modern,
    this.webStyle = true,
    this.rerouteConfigs = const [
      LoginRequiredRerouteConfig(),
    ],
    this.bootConfig = const BootConfig(),
    this.userVariables = const [],
  }) : super();

  /// Page title.
  final String title;

  /// Initial route path.
  final String initialRoute;

  /// Logo Image URL.
  final String? logoUrl;

  /// Menu Settings.
  final List<MenuConfig> menus;

  /// Official Site URL.
  final String? officialUrl;

  /// URL of the support site.
  final String? supportUrl;

  /// Privacy Policy URL.
  final String? privacyPolicyUrl;

  /// URL of Terms of Use.
  final String? termsUrl;

  /// App roles.
  final List<RoleConfig> roles;

  /// Theme color for light.
  final ThemeColor? lightTheme;

  /// Theme color for dark.
  final ThemeColor? darkTheme;

  /// Theme Mode.
  final ThemeMode themeMode;

  /// Initial page transition.
  final PageTransition initialPageTransition;

  /// App design type.
  final DesignType designType;

  /// If you want to use the style for web when you are on the web, use `true`.
  final bool webStyle;

  /// Reroute path settings to configure pages that require conditions.
  final List<RerouteConfig> rerouteConfigs;

  /// Boot screen settings.
  final BootConfig bootConfig;

  /// User's value setting.
  final List<VariableConfig> userVariables;

  /// Get the AppModule being used.
  static AppModule? get registered {
    if (_registered != null) {
      return _registered!;
    }
    if (Module._registeredModules.isEmpty) {
      return null;
    }
    return Module._registeredModules.whereType<AppModule>().firstOrNull;
  }

  static AppModule? _registered;

  /// Convert the module information from [DynamicMap].
  @override
  AppModule? fromMap(DynamicMap map) {
    if (map.get("type", "") != type || !map.containsKey("name")) {
      return null;
    }
    return AppModule(
      title: map.get("name", ""),
      initialRoute: map.get("initialRoute", "/"),
      logoUrl: map.get<String?>("logoUrl", null),
      menus: map
          .getAsList<DynamicMap>("menu")
          .mapAndRemoveEmpty((item) => item.toMenuConfig()),
      officialUrl: map.get<String?>("officialUrl", null),
      supportUrl: map.get<String?>("supportUrl", null),
      privacyPolicyUrl: map.get<String?>("privacyUrl", null),
      termsUrl: map.get<String?>("termsUrl", null),
      roles: map
          .getAsList<DynamicMap>("role")
          .mapAndRemoveEmpty((item) => item.toRoleConfig()),
      lightTheme: map.getAsMap("lightTheme").toThemeColor(),
      darkTheme: map.getAsMap("darkTheme").toThemeColor(),
      themeMode: ThemeMode.values.firstWhere(
          (e) => e.index == map.get<int>("themeMode", ThemeMode.system.index)),
      designType: DesignType.values.firstWhere((e) =>
          e.index == map.get<int>("designType", DesignType.modern.index)),
      webStyle: map.get("webStyle", true),
      bootConfig: map.getAsMap("boot").toBootConfig() ?? const BootConfig(),
    );
  }

  /// Convert the module information to [DynamicMap].
  @override
  DynamicMap toMap() {
    return <String, dynamic>{
      "name": title,
      "type": type,
      "initialRoute": initialRoute,
      if (logoUrl.isNotEmpty) "logoUrl": logoUrl!,
      "menu": menus.mapAndRemoveEmpty((item) => item.toMap()),
      if (officialUrl.isNotEmpty) "officialUrl": officialUrl!,
      if (supportUrl.isNotEmpty) "supportUrl": supportUrl!,
      if (privacyPolicyUrl.isNotEmpty) "privacyUrl": privacyPolicyUrl!,
      if (termsUrl.isNotEmpty) "termsUrl": termsUrl!,
      "role": roles.mapAndRemoveEmpty((item) => item.toMap()),
      if (lightTheme != null) "lightTheme": lightTheme!.toMap(),
      if (darkTheme != null) "darkTheme": darkTheme!.toMap(),
      "themeMode": themeMode.index,
      "designType": DesignType.modern,
      "webStyle": webStyle,
      "boot": bootConfig.toMap(),
    };
  }

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
}
