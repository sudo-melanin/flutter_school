import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: FeedbackLesson(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class FeedbackLesson extends StatefulWidget {
  const FeedbackLesson({super.key});

  @override
  State<FeedbackLesson> createState() => _FeedbackLessonState();
}

class _FeedbackLessonState extends State<FeedbackLesson> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirmSelection(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Entry"),
          content: Text("Do you want to save ${_controller.text} to Market Gist?"),
          actions: [
            //Cancel action
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No, wait"),
            ),

            // Confirm action
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showFeedback();
              },
              child: const Text("Yes, Save")
            )
          ],
        );
      });
  }

  void _showFeedback(){
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please, Enter a text!"),
          backgroundColor: Colors.red,
        )
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Saving: ${_controller.text}"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "UNDO",
          textColor: Colors.white,
          onPressed: () {
            //Logic for undoing goes in here!!
          }
        ),
      )
    );

    _controller.clear();
  }


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons and Feedback!"),
        backgroundColor: Colors.green[400],
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Market Item"
              ),
            ),
            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: _confirmSelection,
              child: const Text("Confirm with dialog"),
            ),

            ElevatedButton(
              onPressed: _showFeedback,
              child: const Text("Submit Gist")
            )
          ],
        ),
      ),
    );
  }
}