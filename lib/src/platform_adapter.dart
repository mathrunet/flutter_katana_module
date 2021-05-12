part of katana_module;

/// Abstract class for creating adapters for platforms.
@immutable
abstract class PlatformAdapter {
  const PlatformAdapter();

  /// Display the media dialog and get the data.
  ///
  /// You can limit the media type by specifying [mediaType].
  Future<dynamic> mediaDialog(
    BuildContext context, {
    required String title,
    PlatformMediaType type = PlatformMediaType.all,
  });
}

/// Specifies the media type.
enum PlatformMediaType {
  /// All.
  all,

  /// Image.
  image,

  /// Video.
  video,
}
