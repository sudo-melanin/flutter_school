import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: InputLesson(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class InputLesson extends StatefulWidget{
  const InputLesson({super.key});

  @override
  State<InputLesson> createState() => _InputLessonState();
}

class _InputLessonState extends State<InputLesson> {
  final TextEditingController _itemController = TextEditingController();
  String _itemName = "";

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  void _submitData(){
    setState(() {
      _itemName = _itemController.text;
    });
  }


  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Input Lesson"),
        backgroundColor: Colors.green[300],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              _itemName.isEmpty ? "What are you pricing?" : "Entry: $_itemName",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                labelText: "Product Name (e.g. Rice, Beans)",
                hintText: "Enter item name....",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
              ),
              onChanged: (value) => _submitData(),
              maxLines: 3,
              minLines: 1,
            ),
            const SizedBox(height: 30,),

            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: const Text("Save to Gist")
              )
          ],
        ),
      ),
    );
  }
}