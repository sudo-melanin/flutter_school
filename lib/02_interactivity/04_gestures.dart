import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GestureLesson(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class GestureLesson extends StatefulWidget {
  const GestureLesson({super.key});

  @override
  State<GestureLesson> createState() => _GestureLessonState();
}

class _GestureLessonState extends State<GestureLesson> {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Lesson"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gesture Detector: The invisible Wrapper
            GestureDetector(
              onTap: () => print("Cotainer Tapped!"),
              onDoubleTap: () => print("Double Tapped!"),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue[100],
                child: const Text("I am a clickable container"),
              ),
            ),
            const SizedBox(height: 40),

            //INKWELL: The material Ripple
            Material(                 // required for the ripple to show
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: const Text("I have a ripple effect"),
                ),
              ),
            ),

            const SizedBox(height: 30,),

            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () {
                  print("Navigating to Product Details...");
                },
                borderRadius: BorderRadius.circular(15), // Matches the Material border
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text("Product: Nigerian Rice (50kg)"),
                ),
              ),
            )  
          ],
        ),
      )
    );
  }
}