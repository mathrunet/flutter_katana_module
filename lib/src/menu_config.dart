part of katana_module;

/// Class for config the menu.
class MenuConfig {
  /// Class for config the menu.
  const MenuConfig({
    required this.name,
    this.text,
    this.icon,
    this.path,
    this.children = const [],
    this.availableRole = const [],
  });

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

  /// Available Role IDs.
  ///
  /// If empty, all roles are available.
  final List<String> availableRole;

  static MenuConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("name")) {
      return null;
    }
    return MenuConfig(
      name: map.get("name", ""),
      text: map.get<String?>("text", null),
      path: map.get<String?>("path", null),
      icon: map.getAsMap("icon").toIconData(),
      children: map
          .getAsList<DynamicMap>("children")
          .mapAndRemoveEmpty((item) => item.toMenuConfig()),
      availableRole: map.getAsList<String>("available"),
    );
  }

  /// Convert the menu style to [DynamicMap].
  DynamicMap toMap() {
    return <String, dynamic>{
      "name": name,
      if (text.isNotEmpty) "text": text!,
      if (path.isNotEmpty) "path": path!,
      if (icon != null) "icon": icon!.toMap(),
      if (children.isNotEmpty)
        "children": children.map((item) => item.toMap()).toList(),
      if (availableRole.isNotEmpty) "available": availableRole,
    };
  }
}
