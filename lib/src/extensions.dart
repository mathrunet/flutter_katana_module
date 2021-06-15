part of katana_module;

extension ModuleBuildContextExtensions on BuildContext {
  /// Get the model adapter.
  ModelAdapter? get model {
    return AdapterScope.of(this).modelAdapter;
  }

  /// Get the platform adapter.
  PlatformAdapter? get platform {
    return AdapterScope.of(this).platformAdapter;
  }

  /// Get the module role.
  List<RoleConfig> get roles {
    return RoleScope.of(this).roles;
  }

  /// Get the app module config.
  AppModule? get app {
    return AppScope.of(this).app;
  }
}

extension RoleConfigExtensions on RoleConfig {
  /// Searches for permissions to be included.
  bool containsPermission(String permission) {
    return permissions.contains(permission);
  }
}

extension NullableRoleConfigExtensions on RoleConfig? {
  /// Searches for permissions to be included.
  bool containsPermission(String permission) {
    if (this == null) {
      return false;
    }
    return this!.permissions.contains(permission);
  }
}

extension ModuleIconDataExtensions on IconData? {
  /// Convert the icon data to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    return <String, dynamic>{
      "code": this!.codePoint,
      if (this!.fontFamily.isNotEmpty) "family": this!.fontFamily,
      if (this!.fontPackage.isNotEmpty) "package": this!.fontPackage,
    };
  }
}

extension ModuleColorExtensions on Color? {
  /// Convert the color to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    return <String, dynamic>{
      "code": this!.value,
    };
  }
}

extension ModuleTextStyleExtensions on TextStyle? {
  /// Convert the text style to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    return <String, dynamic>{
      if (this!.fontSize != null) "size": this!.fontSize,
      if (this!.color != null) "color": this!.color!.value,
      if (this!.fontWeight != null) "weight": this!.fontWeight!.index,
      if (this!.fontStyle != null) "style": this!.fontStyle!.index,
      if (this!.backgroundColor != null)
        "backgroundColor": this!.backgroundColor!.value,
    };
  }
}

extension ModuleAlignmentExtensions on Alignment? {
  /// Convert the alignment to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    return <String, dynamic>{
      "x": this!.x,
      "y": this!.y,
    };
  }
}

extension ModuleSizeExtensions on Size? {
  /// Convert the size to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    return <String, dynamic>{
      "width": this!.width,
      "height": this!.height,
    };
  }
}

extension ModuleEdgeInsetsGeometryExtensions on EdgeInsetsGeometry? {
  /// Convert the edge insets to [DynamicMap].
  DynamicMap toMap() {
    if (this == null) {
      return <String, dynamic>{};
    }
    final edgeInsets = this!.resolve(TextDirection.ltr);
    return <String, dynamic>{
      "left": edgeInsets.left,
      "right": edgeInsets.right,
      "top": edgeInsets.top,
      "bottom": edgeInsets.bottom,
    };
  }
}

extension ModuleDynamicMapExtensions on DynamicMap? {
  /// Convert the icon data from [DynamicMap].
  T? toModule<T extends Module>() {
    if (isEmpty) {
      return null;
    }
    return Module._fromMap<T>(this!);
  }

  /// Convert the icon data from [DynamicMap].
  IconData? toIconData() {
    if (isEmpty || !containsKey("code")) {
      return null;
    }
    return IconData(
      get("code", 0),
      fontFamily: get<String?>("family", null),
      fontPackage: get<String?>("package", null),
    );
  }

  /// Convert the color from [DynamicMap].
  Color? toColor() {
    if (isEmpty || !containsKey("code")) {
      return null;
    }
    return Color(get("code", 0));
  }

  /// Convert the text style from [DynamicMap].
  TextStyle? toTextStyle() {
    if (isEmpty) {
      return null;
    }
    final color = get<int?>("color", null);
    final backgroundColor = get<int?>("backgroundColor", null);
    return TextStyle(
      fontSize: get<double?>("size", null),
      color: color != null ? Color(color) : null,
      backgroundColor: backgroundColor != null ? Color(backgroundColor) : null,
      fontWeight: FontWeight.values
          .firstWhereOrNull((e) => e.index == get<int?>("weight", null)),
      fontStyle: FontStyle.values
          .firstWhereOrNull((e) => e.index == get<int?>("style", null)),
    );
  }

  /// Convert the alignment from [DynamicMap].
  Alignment? toAlignment() {
    if (isEmpty || !containsKey("x") || !containsKey("y")) {
      return null;
    }
    return Alignment(get("x", 0.0), get("y", 0.0));
  }

  /// Convert the size from [DynamicMap].
  Size? toSize() {
    if (isEmpty || !containsKey("width") || !containsKey("height")) {
      return null;
    }
    return Size(get("width", 0.0), get("height", 0.0));
  }

  /// Convert the edge insets from [DynamicMap].
  EdgeInsets? toEdgeInsets() {
    if (isEmpty ||
        !containsKey("left") ||
        !containsKey("right") ||
        !containsKey("top") ||
        !containsKey("bottom")) {
      return null;
    }
    return EdgeInsets.fromLTRB(
      get("left", 0.0),
      get("top", 0.0),
      get("right", 0.0),
      get("bottom", 0.0),
    );
  }

  /// Convert the menu config from [DynamicMap].
  MenuConfig? toMenuConfig() {
    if (this == null) {
      return null;
    }
    return MenuConfig._fromMap(this!);
  }

  /// Convert the permission from [DynamicMap].
  Permission? toPermission() {
    if (this == null) {
      return null;
    }
    return Permission._fromMap(this!);
  }

  /// Convert the role config from [DynamicMap].
  RoleConfig? toRoleConfig() {
    if (this == null) {
      return null;
    }
    return RoleConfig._fromMap(this!);
  }
}
