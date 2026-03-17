import 'package:flutter/material.dart';
import '../models/market_item.dart';

/// STATE CONTAINER: This class manages the global application state.
/// By extending 'ChangeNotifier', it implements the Observer Pattern, 
/// allowing widgets to subscribe to data updates.
class MarketProvider extends ChangeNotifier {
  
  // ENCAPSULATION: The underscore '_' makes this list private. 
  // This ensures that external classes cannot bypass our logic to modify the data directly.
  final List<MarketItem> _allItems = [];

  // GETTER: Provides a read-only view of the private dataset.
  // This maintains 'Data Integrity' by forcing all modifications to go through defined methods.
  List<MarketItem> get allItems => _allItems;

  /// DATA PERSISTENCE METHOD: Appends a new entry to the collection.
  /// This is the primary 'Command' used by the Entry screens to update the app's state.
  void addItems(MarketItem item) {
    // 1. STATE MUTATION: Adding the new validated object to our internal memory.
    _allItems.add(item);

    // 2. CHANGE NOTIFICATION: This is the core of the 'Reactive' flow.
    // It broadcasts a signal to all 'listening' widgets that they need to re-render.
    notifyListeners();
  }

  /// DELETION LOGIC: Removes a specific entry by its index.
  /// Used for targeted removals within the History list.
  void removeItem(int index) {
    _allItems.removeAt(index);
    notifyListeners();
  }

  /// BULK OPERATION: Wipes all entries from the dataset.
  /// Effectively resets the state of the application's inventory.
  void clearAll() {
    _allItems.clear();
    notifyListeners();
  }

  /// UTILITY METHOD: Resets the data collection.
  /// Demonstrates how global operations are centralized in one location.
  void clearHistory() {
    _allItems.clear();
    notifyListeners();
  }
}