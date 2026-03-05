import 'package:flutter/material.dart';

/// DATA MODEL: A custom class to represent a single market entry.
/// This acts as the structured "blueprint" for all data in the warehouse.
class MarketItem {
  final String name;
  final double price;
  final int quantity;

  MarketItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

void main() {
  runApp(const MaterialApp(
    home: MarketHistory(),
    debugShowCheckedModeBanner: false,
  ));
}

class MarketHistory extends StatefulWidget {
  const MarketHistory({super.key});

  @override
  State<MarketHistory> createState() => _MarketHistoryState();
}

class _MarketHistoryState extends State<MarketHistory> {
  /// THE STATE: A private list to store instances of MarketItem.
  /// This list is the "Source of Truth" for the UI.
  final List<MarketItem> _myGistEntry = [];

  /// BUSINESS LOGIC: Appends a new item to the list.
  /// setState() is called to notify Flutter that the data has changed,
  /// triggering a rebuild of the build() method to show the new item.
  void _addItem() {
    setState(() {
      _myGistEntry.add(
        MarketItem(
          name: "Rice (50kg Bag)",
          price: 75000.0,
          quantity: 1,
        ),
      );
    });

    // Logging for debug purposes to track list growth in the console.
    print("My Market List now contains ${_myGistEntry.length} items");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market List History"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),

      /// DYNAMIC UI RENDERER:
      /// We use a ternary operator to toggle between an empty state message 
      /// and the scrolling list once data exists.
      body: _myGistEntry.isEmpty
          ? const Center(
              child: Text("No items in list yet. Tap + to add"),
            )
          : ListView.builder(
              /// itemCount tells the builder exactly how many rows to generate.
              itemCount: _myGistEntry.length,
              /// itemBuilder runs for every index from 0 to itemCount - 1.
              itemBuilder: (context, index) {
                // Extracts the specific data 'brick' at the current position.
                final item = _myGistEntry[index];

                // Returns a pre-styled Material row for the market data.
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: const Icon(Icons.shopping_bag, color: Colors.green),
                  ),
                  title: Text(item.name),
                  // Formatting currency to 2 decimal places for professionalism.
                  subtitle: Text(
                      "₦${item.price.toStringAsFixed(2)} * ${item.quantity}"),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Dummy Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}