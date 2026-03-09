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
    // It broadcasts a signal to all 'listening' widgets that they need to re-render 
    // to show the updated data.
    notifyListeners();
  }

  /// UTILITY METHOD (Optional): Resets the data collection.
  /// Demonstrates how global operations are centralized in one location.
  void clearHistory() {
    _allItems.clear();
    notifyListeners();
  }
}