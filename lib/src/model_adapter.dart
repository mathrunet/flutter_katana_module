part of katana_module;

/// This class is used to specify data adapters for modules.
///
/// Specify the Document class in [Document],
/// the Collection class in [Collection], and the Provider for each.
///
/// [ModelAdapter] can switch the data
/// when the module is used by passing it to [UIMaterialApp].
@immutable
abstract class ModelAdapter<TDocument extends DynamicDocumentModel,
    TCollection extends DynamicCollectionModel> extends Module {
  const ModelAdapter();

  /// Gets the provider of the [Document].
  ///
  /// In [path], enter the path where you want to retrieve the document.
  ChangeNotifierProvider<TDocument> documentProvider(String path);

  /// Performs the process of loading a document.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  ///
  /// If you set [once] to `true`, [loadOnce] is used even if the model can use [listen].
  TDocument loadDocument(TDocument document, [bool once = false]);

  /// Performs the process of loading a document.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  // TDocument listenDocument(TDocument document);

  /// Gets the provider of the [Collection].
  ///
  /// In [path], enter the path where you want to retrieve the collection.
  ChangeNotifierProvider<TCollection> collectionProvider(String path);

  /// Performs the process of loading a collection.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  ///
  /// If you set [once] to `true`, [loadOnce] is used even if the model can use [listen].
  TCollection loadCollection(TCollection collection, [bool once = false]);

  /// Performs the process of loading a collection.
  ///
  /// Usually, you specify a method that can be executed only the first time,
  /// such as [loadOnce] or [listen].
  // TCollection listenCollection(TCollection collection);

  /// Retrieves a document from a [collection].
  ///
  /// By specifying [id], you can specify the ID of newly created document.
  /// If not specified, [uuid] will be used.
  TDocument createDocument(TCollection collection, [String? id]);

  /// Save the data in the document so that
  /// you can use it after restarting the app.
  Future<void> saveDocument(TDocument document);

  /// Deletes information associated with a document.
  Future<void> deleteDocument(TDocument document);

  /// Upload your media.
  Future<String> uploadMedia(String path);

  /// Used to restore your login information.
  Future<void> tryRestoreAuth();

  /// Guest login.
  Future<void> signInAnonymously({
    DynamicMap? data,
    String userPath = "user",
  });

  /// Login using your [email] and [password].
  Future<void> signInEmailAndPassword({
    required String email,
    required String password,
    DynamicMap? data,
    String userPath = "user",
  });

  /// Log out.
  Future<void> signOut();

  /// Register as a user using your [email] and [password].
  Future<void> registerInEmailAndPassword({
    required String email,
    required String password,
    DynamicMap? data,
    String userPath = "user",
  });

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
