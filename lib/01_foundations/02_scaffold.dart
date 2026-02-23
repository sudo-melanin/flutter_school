import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffoldPage(),
    ),
  );
}

class MyScaffoldPage extends StatelessWidget {
  const MyScaffoldPage({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Melanin Man Learning Curve"),
        backgroundColor: Colors.green,
      ),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text("User Profile",
                style: TextStyle(color: Colors.white),)
            ),
            ListTile(
              title: Text("My Account"),
            ),
          ]
        ),
      ),

      body: const Center(
        child: Text(
          "We building this knowledge brick by brick",
          style: TextStyle(fontSize: 24),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
            print("Button Pressed");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}