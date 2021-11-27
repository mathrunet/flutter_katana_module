part of katana_module;

/// Module adapter for setting up purchasing.
///
/// [PurchaseAdapter] can switch the data
/// when the module is used by passing it to [UIMaterialApp].
@immutable
abstract class PurchaseAdapter<T extends PurchaseProduct> extends Module {
  const PurchaseAdapter();

  /// Class for managing billing process.
  ///
  /// Initialize by first executing [initialize()].
  ///
  /// Then purchasing item by executing [purchase()].
  Future<void> initialize();

  /// Restore purchase.
  ///
  /// Please use it manually or immediately after user registration.
  Future<void> restore();

  /// Consume all purchased items.
  ///
  /// Please use it manually or immediately after user registration.
  Future<void> consume(T product);

  /// Process the purchase.
  ///
  /// You specify the purchase product data in [product], the billing process will start.
  Future<void> purchase(
    T product, {
    String? applicationUserName,
    bool sandboxTesting = false,
  });

  /// Get the [PurchaseProduct] list.
  List<T> getProducts();

  /// Find the [PurchaseProduct] from [ProductId].
  T? getProduct(String productId);

  /// Find the [PurchaseProduct] from [ProductId].
  T? findById(String productId);
}
