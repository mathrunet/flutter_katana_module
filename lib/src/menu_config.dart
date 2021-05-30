part of katana_module;

/// Class for configuring the menu.
class MenuConfig {
  /// Class for configuring the menu.
  const MenuConfig(
      {required this.name,
      this.text,
      this.icon,
      this.path,
      this.children = const []});

  /// Menu icon.
  final IconData? icon;

  /// Menu name.
  final String name;

  /// Menu description.
  final String? text;

  /// The root path to transition to when clicked.
  final String? path;

  /// Child elements.
  final List<MenuConfig> children;
}
