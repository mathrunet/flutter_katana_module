part of katana_module;

/// Module for configuring the entire application.
@immutable
class AppModule extends Module {
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
    this.themeColor,
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

  /// Theme color.
  final ThemeColor? themeColor;

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
      themeColor: map.getAsMap("theme").toThemeColor(),
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
      if (themeColor != null) "theme": themeColor!.toMap(),
    };
  }
}
