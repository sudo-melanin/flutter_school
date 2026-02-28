import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LogicLesson(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class LogicLesson extends StatefulWidget {
  const LogicLesson({super.key});

  @override
  State<LogicLesson> createState() => _LogicLessonState();
}

class _LogicLessonState extends State<LogicLesson> {
  final TextEditingController _priceController = TextEditingController();
  double _totalWithTax = 0.0;
  

  // 1. THE LOGIC FUNCTION - This handles the math away from the UI code.

  void _calculateTotal(String input) {

    const discount = 500;
    double price = double.tryParse(input) ?? 0.0;

    // Applying a 7.5% VAT (Value Added Tax)
    double taxRate = 0.075;

    setState(() {
      if(price > 5000){
      _totalWithTax = price + (price * taxRate) - discount;
      }else{
        _totalWithTax = (price + (price * taxRate));
      }
    });
  }

  @override
  void dispose(){
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logic Lesson Brick!"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Base Price",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _calculateTotal(value),
            ),
            const SizedBox(height: 30),

            // Displaying the result of the logic
            Text(
              "Total with VAT: ${_totalWithTax.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}