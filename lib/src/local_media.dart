part of katana_module;

/// Class for storing local media data.
///
/// The path of the local file in [path].
///
/// Specify image or video for [assetType].
class LocalMedia {
  /// Class for storing local media data.
  ///
  /// The path of the local file in [path].
  ///
  /// Specify image or video for [assetType].
  const LocalMedia({this.path, this.assetType = AssetType.none});

  /// Local Path.
  final String? path;

  /// Specify image or video.
  final AssetType assetType;

  /// If the path exists, `true`.
  bool get hasPath => path.isNotEmpty;
}

/// Defines the type of asset.
enum AssetType {
  /// None.
  none,

  /// Text.
  text,

  /// Image.
  image,

  /// Audio.
  audio,

  /// Video
  video
}
