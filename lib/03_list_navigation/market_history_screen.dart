import 'package:flutter/material.dart';
import '../models/market_item.dart';

/// DISPLAY SCREEN: Responsible for rendering the history of market entries.
/// This widget acts as the 'Receiver' for data sent from the Entry Screen.
class MarketHistoryScreen extends StatefulWidget {
  /// The "Receiving Dock": A parameter that optionally accepts a MarketItem 
  /// passed during navigation.
  final MarketItem? newItem;

  const MarketHistoryScreen({super.key, this.newItem});

  @override
  State<MarketHistoryScreen> createState() => _MarketHistoryScreenState();
}

class _MarketHistoryScreenState extends State<MarketHistoryScreen> {
  /// THE WAREHOUSE: A private list that holds the current session's entries.
  /// Note: This list resets if the screen is destroyed and rebuilt.
  final List<MarketItem> _myEntries = [];

  /// LIFECYCLE METHOD: Runs once when the widget is first inserted into the tree.
  @override
  void initState() {
    super.initState();
    
    /// DATA TRANSFER LOGIC: 
    /// Check if 'newItem' was provided via the constructor.
    /// We use 'widget.' to access variables from the parent StatefulWidget class.
    if (widget.newItem != null) {
      // The '!' tells Dart we are 100% sure the item is not null here.
      _myEntries.add(widget.newItem!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market History"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),

      /// CONDITIONAL RENDERING: 
      /// Displays a message if the warehouse is empty, otherwise builds the list.
      body: _myEntries.isEmpty
          ? const Center(
              child: Text("No items saved yet!"),
            )
          : ListView.builder(
              /// PERFORMANCE ENGINE: Only renders items currently visible on screen.
              itemCount: _myEntries.length,
              itemBuilder: (context, index) {
                // Accessing the specific data 'brick' by its position (index).
                final item = _myEntries[index];

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.shopping_bag),
                  ),
                  title: Text(item.name),
                  // Formatting currency to 2 decimal places for a clean UI.
                  subtitle: Text(
                      "\$${item.price.toStringAsFixed(2)} * ${item.quantity}"),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
            ),
    );
  }
}