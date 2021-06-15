part of katana_module;

/// Set the permissions.
///
/// You can set multiple permissions in
/// [permissions] to specify what this user can do.
@immutable
class RoleConfig {
  /// Set the permissions.
  ///
  /// You can set multiple permissions in
  /// [permissions] to specify what this user can do.
  const RoleConfig({
    required this.id,
    this.label,
    this.color,
    this.icon,
    this.path,
    this.permissions = const [],
  });

  /// ID of the role.
  final String id;

  /// The display name of the role.
  final String? label;

  /// Icon of roll.
  final IconData? icon;

  /// Color of roll.
  final Color? color;

  /// The page path to go to when you tap the roll.
  final String? path;

  /// Permissions for the role.
  final List<String> permissions;

  static RoleConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("id")) {
      return null;
    }
    return RoleConfig(
      id: map.get("id", uuid),
      label: map.get<String?>("name", null),
      icon: map.getAsMap("icon").toIconData(),
      color: map.getAsMap("color").toColor(),
      path: map.get<String?>("path", null),
      permissions: map.getAsList<String>("permission"),
    );
  }

  /// Convert the role config to [DynamicMap].
  DynamicMap toMap() {
    return <String, dynamic>{
      "id": id,
      if (label.isNotEmpty) "name": label!,
      if (path.isNotEmpty) "path": path!,
      if (icon != null) "icon": icon!.toMap(),
      if (color != null) "color": color!.toMap(),
      if (permissions.isNotEmpty) "permission": permissions,
    };
  }
}
