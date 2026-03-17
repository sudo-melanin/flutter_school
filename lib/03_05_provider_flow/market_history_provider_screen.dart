import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/market_provider.dart';

/// DISPLAY MODULE: This screen renders the persisted list of market entries.
/// It is a 'StatelessWidget' because it delegates state management to the Provider,
/// allowing the UI to remain lightweight and reactive.
class MarketHistoryProviderScreen extends StatelessWidget {
  const MarketHistoryProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // STATE CONSUMPTION: Establishes a formal link between this widget and the MarketProvider.
    // By default, this creates a 'listener'; whenever the Provider calls notifyListeners(),
    // this build method triggers automatically to reflect the new data.
    final marketData = Provider.of<MarketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Market History V3.5"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          // CONDITIONAL ACTION: Only displays the 'Clear All' option if the dataset contains items.
          if (marketData.allItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.white),
              tooltip: "Clear All",
              onPressed: () {
                // DISPATCHING ACTION: Triggering the global reset logic in the Provider.
                context.read<MarketProvider>().clearAll();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Inventory Cleared"), backgroundColor: Colors.redAccent),
                );
              },
            )
        ],
      ),

      // CONDITIONAL RENDERING: Evaluates the dataset's length to toggle between 
      // an 'Empty State' placeholder and the actual data list.
      body: marketData.allItems.isEmpty
          ? const Center(
              child: Text(
                "No History of Items",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              // PERFORMANCE OPTIMIZATION: ListView.builder utilizes 'Lazy Loading'.
              // It only renders the widgets currently visible in the viewport.
              itemCount: marketData.allItems.length,
              itemBuilder: (context, index) {
                // DATA MAPPING: Accessing the specific MarketItem instance by its index.
                final item = marketData.allItems[index];

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // DERIVED LOGIC: Performing the calculation within the UI layer 
                  // to display the total valuation of the entry.
                  subtitle: Text(
                    "Total Valuation: \$${(item.price * item.quantity).toStringAsFixed(2)}",
                  ),
                  // ITEM-SPECIFIC ACTION: Provides the ability to remove a single entry.
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      // STATE MODIFICATION: Calling the removeItem method by index.
                      context.read<MarketProvider>().removeItem(index);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${item.name} deleted"),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}