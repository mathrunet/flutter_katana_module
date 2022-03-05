part of katana_module;

extension ModuleBuildContextExtensions on BuildContext {
  /// Get the model adapter.
  ModelAdapter? get model {
    return AdapterScope.of(this)?.modelAdapter;
  }

  /// Get the adapter plugins.
  AdapterPlugins? get plugin {
    return AdapterScope.of(this)?.plugin;
  }

  /// Get the platform adapter.
  PlatformAdapter? get platform {
    return AdapterScope.of(this)?.platformAdapter;
  }

  /// Get the module role.
  List<RoleConfig> get roles {
    return RoleScope.of(this)?.roles ?? [];
  }

  /// Get the app module config.
  AppModule? get app {
    return AppScope.of(this)?.app;
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

extension SignInAdapterListExtensions on List<SignInAdapter>? {
  Future<void> signOut(BuildContext context) async {
    if (this == null) {
      return;
    }
    final providerIds = context.model?.activeProviders ?? const [];
    if (providerIds.isEmpty) {
      await context.model?.signOut();
      return;
    }
    for (final sns in this!) {
      final id = sns.provider;
      if (!providerIds.any((tmp) => tmp.contains(id))) {
        continue;
      }
      await sns.signOut();
      return;
    }
    await context.model?.signOut();
  }
}

extension WidgetRefModelExtensions on WidgetRef {
  /// Get the document model of [path] from the resource registered with Adapter.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicDocumentModel readDocumentModel(String path, [bool once = false]) {
    final context = this as BuildContext;

    return context.model!.loadDocument(
      read(
        context.model!.documentProvider(applyModuleTag(path)),
      ),
      once,
    );
  }

  /// Get the collection model of [path] from the resource registered with Adapter.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicCollectionModel readCollectionModel(String path, [bool once = false]) {
    final context = this as BuildContext;

    return context.model!.loadCollection(
      read(
        context.model!.collectionProvider(applyModuleTag(path)),
      ),
      once,
    );
  }

  /// Get the searchable collection model of [path] from the resource registered with Adapter.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicSearchableCollectionModel readSearchableCollectionModel(String path) {
    final context = this as BuildContext;

    return read(
      context.model!.searchableCollectionProvider(applyModuleTag(path)),
    );
  }

  /// Get the user document model of [path] from the resource registered with Adapter.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicDocumentModel readUserDocumentModel([String userPath = Const.user]) {
    final context = this as BuildContext;

    return context.model!.loadDocument(
      read(
        context.model!.documentProvider(
          applyModuleTag("$userPath/${context.model?.userId}"),
        ),
      ),
    );
  }

  /// Get the document model of [path] from the resource registered with Adapter.
  ///
  /// After acquisition, monitor changes.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicDocumentModel watchDocumentModel(String path, [bool once = false]) {
    final context = this as BuildContext;

    return context.model!.loadDocument(
      watch(
        context.model!.documentProvider(
          applyModuleTag(path),
        ),
      ),
      once,
    );
  }

  /// Get the collection model of [path] from the resource registered with Adapter.
  ///
  /// After acquisition, monitor changes.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicCollectionModel watchCollectionModel(String path,
      [bool once = false]) {
    final context = this as BuildContext;

    return context.model!.loadCollection(
      watch(
        context.model!.collectionProvider(
          applyModuleTag(path),
        ),
      ),
      once,
    );
  }

  /// Get the searchable collection model of [path] from the resource registered with Adapter.
  ///
  /// After acquisition, monitor changes.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicSearchableCollectionModel watchSearchableCollectionModel(String path) {
    final context = this as BuildContext;

    return watch(
      context.model!.searchableCollectionProvider(
        applyModuleTag(path),
      ),
    );
  }

  /// Get the user document model of [path] from the resource registered with Adapter.
  ///
  /// After acquisition, monitor changes.
  ///
  /// Setting `[once]' to `true' will retrieve data only once.
  DynamicDocumentModel watchUserDocumentModel([String userPath = Const.user]) {
    final context = this as BuildContext;

    return context.model!.loadDocument(
      watch(
        context.model!.documentProvider(
          applyModuleTag("$userPath/${context.model?.userId}"),
        ),
      ),
    );
  }
}
