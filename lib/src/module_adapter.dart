part of katana_module;

/// This class is used to specify data adapters for modules.
///
/// Specify the Document class in [Document],
/// the Collection class in [Collection], and the Provider for each.
///
/// [ModuleAdapter] can switch the data
/// when the module is used by passing it to [UIMaterialApp].
@immutable
abstract class ModuleAdapter {
  const ModuleAdapter();

  /// Gets the provider of the [Document].
  ///
  /// In [path], enter the path where you want to retrieve the document.
  ModelProvider<T> documentProvider<T extends DynamicDocumentModel>(
      String path);

  /// Performs the process of loading a document.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  T loadDocument<T extends DynamicDocumentModel>(T document);

  /// Gets the provider of the [Collection].
  ///
  /// In [path], enter the path where you want to retrieve the collection.
  ModelProvider<T> collectionProvider<T extends DynamicCollectionModel>(
      String path);

  /// Performs the process of loading a collection.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  T loadCollection<T extends DynamicCollectionModel>(T collection);

  /// Save the data in the document so that
  /// you can use it after restarting the app.
  Future<void> saveDocument<T extends DynamicDocumentModel>(T document);

  /// Deletes information associated with a document.
  Future<void> deleteDocument<T extends DynamicDocumentModel>(T document);

  /// Upload your media.
  Future<String> uploadMedia(String path);

  /// Used to restore your login information.
  Future<void> tryRestoreAuth();

  /// Guest login.
  Future<void> signInAnonymously();

  /// Login using your [email] and [password].
  Future<void> signInEmailAndPassword(
      {required String email, required String password});

  /// Log out.
  Future<void> signOut();

  /// Register as a user using your [email] and [password].
  Future<void> registerInEmailAndPassword(
      {required String email, required String password});

  /// Email for password reset will be sent to the specified [email].
  Future<void> sendPasswordResetEmail({required String email});

  /// Return `true` If authentication is enabled.
  bool get enabledAuth;

  /// True if you are signed in.
  bool get isSignedIn;

  /// You can get the UID after authentication is completed.
  ///
  /// Null is returned if authentication is not completed.
  String get userId;

  /// You can get the Email after authentication is completed.
  ///
  /// Null is returned if authentication is not completed.
  String get email;

  /// You can get the status that user email is verified
  /// after authentication is completed.
  bool get isVerified;

  /// You can get the PhoneNumber after authentication is completed.
  ///
  /// Null is returned if authentication is not completed.
  String get phoneNumber;

  /// You can get the PhotoURL after authentication is completed.
  ///
  /// Null is returned if authentication is not completed.
  String get photoURL;

  /// You can get the Display Name after authentication is completed.
  ///
  /// Null is returned if authentication is not completed.
  String get name;

  /// For anonymous logged in users, True.
  bool get isAnonymously;
}
