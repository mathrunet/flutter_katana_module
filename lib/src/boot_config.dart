part of katana_module;

/// Configure the boot screen settings.
@immutable
class BootConfig {
  /// Configure the boot screen settings.
  const BootConfig({
    this.designType = BootDesignType.loading,
    this.logoPath = "assets/icon.png",
    this.backgroundColor,
    this.color,
  });

  /// Design type for boot.
  final BootDesignType designType;

  /// The asset path if the design type is [logo].
  final String logoPath;

  /// The background color of the boot screen.
  final Color? backgroundColor;

  /// Indicator and other colors.
  final Color? color;

  static BootConfig? _fromMap(DynamicMap map) {
    if (!map.containsKey("type")) {
      return null;
    }
    return BootConfig(
      designType: BootDesignType.values.firstWhereOrNull((item) =>
              map.get("type", BootDesignType.loading.index) == item.index) ??
          BootDesignType.loading,
      logoPath: map.get("logo", ""),
      backgroundColor: map.getAsMap("backgroundColor").toColor(),
      color: map.getAsMap("color").toColor(),
    );
  }

  /// Convert the boot config to [DynamicMap].
  DynamicMap toMap() {
    return <String, dynamic>{
      "type": designType.index,
      if (logoPath.isNotEmpty) "logo": logoPath,
      if (backgroundColor != null) "backgroundColor": backgroundColor.toMap(),
      if (color != null) "color": color.toMap(),
    };
  }
}

/// Design type for boot.
enum BootDesignType {
  /// Animation for loading.
  loading,

  /// Logo display.
  logo,

  /// A simple indicator.
  indicator,
}
