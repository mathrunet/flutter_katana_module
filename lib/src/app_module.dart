part of katana_module;

/// Module for configuring the entire application.
@immutable
class AppModule extends ModuleConfig {
  /// Module for configuring the entire application.
  const AppModule({
    required String title,
    this.logoUrl,
    String initialRoute = "/",
    this.officialUrl,
    this.supportUrl,
    this.privacyPolicyUrl,
    this.termsUrl,
    this.menus = const [],
  }) : super(title: title, initialRoute: initialRoute);

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
}
