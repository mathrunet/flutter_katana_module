part of katana_module;

/// This class is used to specify data adapters for modules.
///
/// Specify the Document class in [Document],
/// the Collection class in [Collection], and the Provider for each.
///
/// [ModuleAdapter] can switch the data
/// when the module is used by passing it to [UIMaterialApp].
@immutable
abstract class ModuleAdapter<
    TDocument extends DynamicDocumentModel,
    TCollection extends DynamicCollectionModel<DynamicDocumentModel>,
    DocumentProvider extends ModelProvider<TDocument>,
    CollectionProvider extends ModelProvider<TCollection>> {
  const ModuleAdapter();

  /// Gets the provider of the [Document].
  ///
  /// In [path], enter the path where you want to retrieve the document.
  T documentProvider<T extends DocumentProvider>(String path);

  /// Performs the process of loading a document.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  TDocument loadDocument(TDocument document);

  /// Gets the provider of the [Collection].
  ///
  /// In [path], enter the path where you want to retrieve the collection.
  T collectionProvider<T extends CollectionProvider>(String path);

  /// Performs the process of loading a collection.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  TCollection loadCollection(TCollection collection);

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
  String get uid;

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
