import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/market_item.dart';
import '../providers/market_provider.dart';
import 'market_history_provider_screen.dart';

/// ENTRY MODULE: This screen handles user data intake and validation.
/// It acts as a "Producer" that sends validated data to the Global State (Provider).
class MarketEntryProviderScreen extends StatefulWidget {
  const MarketEntryProviderScreen({super.key});

  @override
  State<MarketEntryProviderScreen> createState() => _MarketEntryProviderScreenState();
}

class _MarketEntryProviderScreenState extends State<MarketEntryProviderScreen> {
  // CONTROLLERS: These objects manage the lifecycle and state of text within the input fields.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // VALIDATION STRINGS: Nullable variables used to display error feedback in the UI.
  String? _nameError;
  String? _priceError;
  String? _qtyError;

  /// CORE BUSINESS LOGIC: Orchestrates data sanitization, validation, and state update.
  void _saveToProvider() {
    // 1. DATA SANITIZATION: Removing whitespace and attempting type conversion.
    final String name = _nameController.text.trim();
    final double? price = double.tryParse(_priceController.text);
    final int? qty = int.tryParse(_qtyController.text);

    // 2. GUARD CLAUSE: Verifies data integrity before proceeding.
    // If validation fails, we notify the user and exit the function to prevent crashes.
    if (name.isEmpty || price == null || qty == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields correctly")),
      );
      return; // Prevents subsequent logic from executing with null values.
    }

    // 3. OBJECT INSTANTIATION: Encapsulating local variables into a structured MarketItem.
    final newItem = MarketItem(name: name, price: price, quantity: qty);

    // 4. DEPENDENCY INJECTION (Provider): Accessing the Global Brain.
    // We use 'listen: false' because this method triggers an action rather than a UI rebuild.
    Provider.of<MarketProvider>(context, listen: false).addItems(newItem);

    // 5. USER FEEDBACK: Immediate confirmation of the save operation.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Saving ${newItem.name} to our market list")),
    );

    // 6. ASYNCHRONOUS NAVIGATION: Transitioning to the History View.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MarketHistoryProviderScreen()),
    );

    // 7. STATE RESET: Clearing the form and error indicators to prepare for new input.
    _nameController.clear();
    _priceController.clear();
    _qtyController.clear();

    setState(() {
      _priceError = null;
      _qtyError = null;
      _nameError = null;
    });
  }

  /// MEMORY MANAGEMENT: Explicitly closing controllers to prevent memory leaks 
  /// when this screen is removed from the widget tree.
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
        title: const Text("Market Entry V3.5"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ITEM NAME INPUT
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Item Name",
                border: const OutlineInputBorder(),
                errorText: _nameError,
              ),
            ),
            const SizedBox(height: 15),

            // PRICE INPUT: Implements real-time reactive validation using 'onChanged'.
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price(\$)",
                border: const OutlineInputBorder(),
                errorText: _priceError,
              ),
              onChanged: (value) => setState(() {
                // Logic: If input is not empty and parsing fails, set the error state.
                if (value.isNotEmpty && double.tryParse(value) == null) {
                  _priceError = "Please enter a valid number";
                } else {
                  _priceError = null;
                }
              }),
            ),
            const SizedBox(height: 15),

            // QUANTITY INPUT: Implements real-time validation for integer types.
            TextField(
              controller: _qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity",
                border: const OutlineInputBorder(),
                errorText: _qtyError,
              ),
              onChanged: (value) => setState(() {
                if (value.isNotEmpty && int.tryParse(value) == null) {
                  _qtyError = "Please enter a valid Number";
                } else {
                  _qtyError = null;
                }
              }),
            ),
            const SizedBox(height: 20),

            // SUBMISSION BUTTON
            ElevatedButton(
              onPressed: _saveToProvider,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text("Save to Provider"),
            )
          ],
        ),
      ),
    );
  }
}