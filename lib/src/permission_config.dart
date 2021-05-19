part of katana_module;

/// Set the permissions for each module.
class PermissionConfig {
  /// Set the permissions for each module.
  const PermissionConfig({
    this.enabled = false,
    this.edit,
    this.watch,
    this.delete,
  });

  /// If you want to enable privilege management, use `true`.
  final bool enabled;

  /// Editing privileges.
  ///
  /// If `null`, everyone has permissions; if the list is empty, everyone has no permissions.
  /// Only roles with an ID in the list will be granted permissions.
  final List<String>? edit;

  /// Viewing privileges.
  ///
  /// If `null`, everyone has permissions; if the list is empty, everyone has no permissions.
  /// Only roles with an ID in the list will be granted permissions.
  final List<String>? watch;

  /// Deletion Authority.
  ///
  /// If `null`, everyone has permissions; if the list is empty, everyone has no permissions.
  /// Only roles with an ID in the list will be granted permissions.
  final List<String>? delete;

  /// If [role] has edit permissions, `true`.
  bool canEdit(String role) {
    if (edit == null) {
      return true;
    }
    return edit.contains(role);
  }

  /// If [role] has watch permissions, `true`.
  bool canWatch(String role) {
    if (watch == null) {
      return true;
    }
    return watch.contains(role);
  }

  /// If [role] has delete permissions, `true`.
  bool canDelete(String role) {
    if (delete == null) {
      return true;
    }
    return delete.contains(role);
  }
}
