import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: StackLesson(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class StackLesson extends StatelessWidget {
  const StackLesson({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Stack Lesson (Layering)"),
        centerTitle: true,
      ),
        body: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Stack is a layout widget that allows you to overlay multiple widgets on top of each other.
              // The first child of the Stack will be at the bottom, and the last child will be at the top.
              // The alignment property of the Stack widget determines how the children are aligned within the stack.
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,           // This makes the container circular
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: const Icon(Icons.person, size: 80, color: Colors.green),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Text(
                    "ACTIVE",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  )
                )
              )
            ],
          ),
        )
      );
  }
}