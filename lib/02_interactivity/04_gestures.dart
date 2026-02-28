import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GestureLesson(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class GestureLesson extends StatefulWidget {
  const GestureLesson({super.key});

  @override
  State<GestureLesson> createState() => _GestureLessonState();
}

class _GestureLessonState extends State<GestureLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Lesson"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GESTURE DETECTOR:
            // A versatile wrapper for detecting raw physical interactions.
            // It provides no visual feedback (ripple) by default but supports 
            // advanced gestures like double taps and dragging.
            GestureDetector(
              onTap: () => print("Container Tapped!"),
              onDoubleTap: () => print("Double Tapped!"),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue[100],
                child: const Text("I am a clickable container"),
              ),
            ),
            const SizedBox(height: 40),

            // INKWELL:
            // A Material Design widget that provides a visual ripple effect on tap.
            // Requires a Material widget ancestor to render the splash animation.
            Material(
              color: Colors.transparent, // Prevents the Material widget from blocking underlying UI
              child: InkWell(
                onTap: () {}, // Tap handler is required for the ripple to trigger
                borderRadius: BorderRadius.circular(10), // Constrains the ripple to the border
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("I have a ripple effect"),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // CUSTOM INTERACTIVE CARD:
            // Implementation of a professional UI card with feedback.
            // Using Material as the base ensures the InkWell ripple is visible.
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () {
                  print("Navigating to Product Details...");
                },
                // borderRadius here ensures the splash follows the card corners
                borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }
}