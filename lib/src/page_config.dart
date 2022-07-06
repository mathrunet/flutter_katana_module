part of katana_module;

/// Config class for describing the page configuration of a module.
@immutable
class PageConfig<TWidget extends Widget> {
  const PageConfig(
    this.path, [
    this.widget,
  ]);
  static final RegExp _keyRegex = RegExp(r"\{([^\}]+)\}");

  /// Page path.
  final String path;

  /// Page widget.
  final TWidget? widget;

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
  ///
  /// Additional strings can be given at the beginning of the path by specifying [prefix].
  String apply([
    Map<String, String> replace = const {},
    String prefix = "",
  ]) {
    if (prefix.isNotEmpty) {
      if (!prefix.startsWith("/")) {
        prefix = "/$prefix";
      }
      if (!path.startsWith("/")) {
        prefix = "$prefix/";
      }
    }

    return "$prefix$path".replaceAllMapped(_keyRegex, (match) {
      final tag = match.group(1);
      if (tag.isNotEmpty && replace.containsKey(tag)) {
        return replace.get(tag!, "");
      } else {
        return "";
      }
    });
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
  ///
  /// Additional strings can be given at the beginning of the path by specifying [prefix].
  PageConfig applyWith([
    Map<String, String> replace = const {},
    String prefix = "",
  ]) {
    return PageConfig(apply(replace, prefix), widget);
  }

  /// Retrieve all query keys (keys enclosed in {}).
  List<String> get queryKeys {
    return _keyRegex.allMatches(path).mapAndRemoveEmpty((e) => e.group(1));
  }
}
