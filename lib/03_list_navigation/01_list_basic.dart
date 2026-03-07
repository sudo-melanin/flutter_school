import 'package:flutter/material.dart';
import '/models/market_item.dart';

/// DATA MODEL: A structured blueprint for market data.
/// Using a class allows us to bundle name, price, and quantity into 
/// a single 'MarketItem' object.
// class MarketItem {
//   final String name;
//   final double price;
//   final int quantity;

//   MarketItem({
//     required this.name,
//     required this.price,
//     required this.quantity,
//   });
// }

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
  // THE WAREHOUSE: An internal list used to store our market items.
  // This is the 'Source of Truth' for this screen.
  final List<MarketItem> _myGistEntry = [];

  /// LOGIC: Creates a new MarketItem instance and adds it to the list.
  /// Wrapping this in setState() ensures the UI reflects the updated list length.
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

    // Tracking the list count in the console for verification.
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

      // INITIAL VIEW: Verifying list connection using a simple counter.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              "Items in Market List: ${_myGistEntry.length}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Click on the + button to add dummy data"),
          ],
        ),
      ),

      // TRIGGER: Calls the _addItem logic to update the state.
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}