import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const MarketEntryForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class MarketEntryForm extends StatefulWidget {
  const MarketEntryForm({super.key});

@override
State<MarketEntryForm> createState() => _MarketEntryFormState();
}

class _MarketEntryFormState extends State<MarketEntryForm> {
  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  double _totalPrice = 0.0;

  void _calculate(){
    double price = double.tryParse(_priceController.text) ?? 0.0;
    double quantity = double.tryParse(_quantityController.text) ?? 0.0;

    setState(() {
        _totalPrice = price * quantity;
      }
    );
  }

  void _confirmEntry(){
    showDialog(
      context: context,
      builder :(BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Entry"),
          content: Text("Save ${_itemName.text} for $_totalPrice NGN?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showFeedback();
                setState(() {
                  _itemName.clear();
                  _priceController.clear();
                  _quantityController.clear();
                  _totalPrice = 0;
                });
              },
              child: const Text("Yes, Save"),
              
            ),
          ],
        );
      }
    );
  }

  void _showFeedback(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Saving ${_itemName.text}"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2)
      )
    );
  }

  @override
  void dispose() {
    _itemName.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return(Scaffold(
      appBar: AppBar(
        title: const Text("Market Gist Entry"),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _itemName,
              decoration: const InputDecoration(
                labelText: "Item Name",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder()
              ),
              onChanged: (value) => _calculate(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder()
              ),
              onChanged: (value) => _calculate(),
            ),
            const SizedBox(height: 18),
            Text(
              "Total Price: ${_totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () => _confirmEntry(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
              child: 
              const Text("Save Entry"))
          ],
        ),),
    ));
  }
}