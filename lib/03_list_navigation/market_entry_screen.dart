import 'package:flutter/material.dart';
import '../models/market_item.dart';
import 'market_history_screen.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MarketEntryScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

/// A screen that allows users to input new market data.
/// Part of the Phase 3 'Lists & Navigation' milestone.
class MarketEntryScreen extends StatefulWidget {
  const MarketEntryScreen({super.key});

  @override
  State<MarketEntryScreen> createState() => _MarketEntryScreenState();
}

class _MarketEntryScreenState extends State<MarketEntryScreen> {
  // Input Controllers: Manage the text state for each form field.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // String? _nameError;
  String? _priceError;
  String? _quantityError;

  /// Handles the data packaging, UI reset, and navigation logic.
  void _saveAndNavigate() {

    // GATHER DATA
    String name = _nameController.text.trim();
    double? price = double.tryParse(_priceController.text);
    int? qty = int.tryParse(_qtyController.text);

    // VALIDATION
    if(name.isEmpty || price == null || qty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid Name, Price and quantity"),
          backgroundColor: Colors.red,
        )
      );
      return;         // Stop, do not navigate
    }
    // 1. DATA PACKAGING: Create a structured object from raw input.
    final newItem = MarketItem(
        name: name,
        price: price,
        quantity: qty,
    );
    // 2. FEEDBACK: Notify the user that the action is being processed.
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Saving ${newItem.name}.....")));

    // 3. STATE RESET: Clear the controllers within setState to refresh the UI form.
    setState(() {
      _nameController.clear();
      _priceController.clear();
      _qtyController.clear();
    // Clears the error also
      _priceError = null;
      _quantityError = null;
    });

    // 4. NAVIGATION: Move to the History screen and pass the 'newItem' as luggage.
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MarketHistoryScreen(newItem: newItem)),
    );
  }

  /// Clean up controllers when the widget is removed from the tree to prevent memory leaks.
  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Market Entry"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Item Name Input
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: "Item Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),

            // Price Input
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Price (\$)", border: const OutlineInputBorder(),
                  errorText: _priceError),
                  onChanged: (value) => setState(() {
                    if(value.isNotEmpty && double.tryParse(value) == null){
                      _priceError = "Enter a valid Number";
                    }else{
                      _priceError = null;
                    }
                  }), 
            ),
            const SizedBox(height: 15),

            // Quantity Input
            TextField(
              controller: _qtyController,
              keyboardType: TextInputType.number,
              decoration:  InputDecoration(
                  labelText: "Quantity", border: const OutlineInputBorder(),
                  errorText: _quantityError),
                  onChanged: (value) => setState(() {
                    if(value.isNotEmpty && int.tryParse(value) == null) {
                      _quantityError = "Please Enter a valid quantity";
                    }else{
                      _quantityError = null;
                    }
                  }),
            ),
            const SizedBox(height: 30),

            // Submission Button
            ElevatedButton(
                onPressed: _saveAndNavigate,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text("Save and View History"))
          ],
        ),
      ),
    );
  }
}