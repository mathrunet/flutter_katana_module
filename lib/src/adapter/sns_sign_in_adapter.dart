part of katana_module;

/// Abstract class for creating adapters for sns sign-in.
@immutable
abstract class SNSSignInAdapter extends AdapterModule {
  const SNSSignInAdapter();

  /// Provider ID.
  String get provider;

  /// Sign in with sns account.
  Future<void> signIn();
}
