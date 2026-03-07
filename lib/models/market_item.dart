/// DATA MODEL: The core blueprint for a single market entry.
/// This class represents the "Structure" of the data being passed 
/// between the Entry Screen and the History Screen.
class MarketItem {
  /// The descriptive name of the item (e.g., "Rice", "Yam").
  final String name;

  /// The cost per unit of the item. 
  /// Uses 'double' to support decimal values for precise pricing.
  final double price;

  /// The number of units purchased.
  final int quantity;

  /// THE CONSTRUCTOR: Forces the creation of a complete object.
  /// Using 'required' ensures that no 'MarketItem' can be created 
  /// with missing information.
  MarketItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}