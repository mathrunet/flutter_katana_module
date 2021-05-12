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
    this.onTap,
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

  /// The process when you tap the roll.
  final VoidCallback? onTap;

  /// Permissions for the role.
  final List<String> permissions;
}
