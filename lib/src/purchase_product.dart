part of katana_module;

/// Product type.
enum ProductType {
  /// Consumable.
  consumable,

  /// Non-Consumable.
  nonConsumable,

  /// Subscription.
  subscription,
}

/// Class for storing information for billing purposes.
@immutable
class PurchaseProduct {
  /// Class for storing information for billing purposes.
  const PurchaseProduct({
    required this.id,
    this.type = ProductType.consumable,
    this.value = 0,
    this.targetPath,
    this.name,
    this.text,
    this.price = 0.0,
  });

  /// Basement id.
  final String id;

  /// Product type.
  final ProductType type;

  /// Product value.
  final double value;

  /// Target path.
  final String? targetPath;

  /// Product name.
  final String? name;

  /// Product description.
  final String? text;

  /// Product price.
  final double price;

  /// Check out if non-consumption items and subscriptions are valid.
  ///
  /// If true, billing is enabled.
  bool get enabled => true;

  /// Product Id.
  String get productId => id;

  /// The name of the item.
  String get productName => name ?? id;

  /// Item description.
  String get productText => text ?? "";

  /// The price of the item.
  String get productPrice => price.toString();

  /// Convert the purchase product to [DynamicMap].
  DynamicMap toMap() {
    return <String, dynamic>{
      "id": id,
      "type": type.index,
      "value": value,
      if (name.isNotEmpty) "name": name,
      if (text.isNotEmpty) "text": name,
      if (price.isNotEmpty) "price": price,
      if (targetPath.isNotEmpty) "targetPath": targetPath,
    };
  }

  /// Convert the purchase product from [DynamicMap].
  PurchaseProduct? fromMap(DynamicMap map) {
    if (!map.containsKey("id")) {
      return null;
    }

    return PurchaseProduct(
      id: map.get("id", ""),
      type: ProductType.values.firstWhereOrNull((e) =>
              e.index == map.get("type", ProductType.consumable.index)) ??
          ProductType.consumable,
      value: map.get("value", 0.0),
      name: map.get<String?>("name", null),
      text: map.get<String?>("text", null),
      price: map.get("price", 0.0),
      targetPath: map.get<String?>("targetPath", null),
    );
  }
}
