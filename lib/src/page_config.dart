part of katana_module;

/// Config class for describing the page configuration of a module.
@immutable
class PageConfig {
  const PageConfig(
    this.path, [
    this.widget,
  ]);
  static final RegExp _keyRegex = RegExp(r"\{([^\}]+)\}");

  /// Page path.
  final String path;

  /// Page widget.
  final Widget? widget;

  /// Convert PageConfig data for RouteSettings.
  Map<String, RouteConfig> toRouteSetting() {
    if (widget == null) {
      return {};
    }
    return {
      path: RouteConfig((_) => widget!),
    };
  }

  /// Convert paths with mapping according to [replace].
  ///
  /// ```
  /// final path = "/detail/{detail_id}";
  /// final page = PageConfig(path);
  /// final replacedPath = page.apply({"detail_id": "12345678"});
  /// ```
  ///
  /// In this case, `replacedPath` will contain `/detail/12345678`.
  String apply(Map<String, String> replace) {
    return path.replaceAllMapped(_keyRegex, (match) {
      final tag = match.group(1);
      if (tag.isNotEmpty && replace.containsKey(tag)) {
        return replace.get(tag!, "");
      } else {
        return "";
      }
    });
  }
}
