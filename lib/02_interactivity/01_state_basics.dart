import 'package:flutter/material.dart';

void main () {
  runApp(
    const MaterialApp(
      home: VibeCounter(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class VibeCounter extends StatefulWidget {
  const VibeCounter({super.key});

  @override
  State<VibeCounter> createState() => _VibeCounterState();
}

class _VibeCounterState extends State<VibeCounter> {
  int vibeCount = 0;

  void _boostVibe(){
    setState(() {
      vibeCount ++;
    });
  }

  void _resetVibe(){
    setState(() {
      vibeCount = 0;
    });
  }

  void _reduceVibe(){
    if (vibeCount > 0) {
      setState(() {
      vibeCount--;
    });
    }
  }

  // @override
  // void initState() {
  // super.initState();
  // print("DEBUG: The Vibe Counter has been born!");
  // }

  // @override
  // void dispose() {
  // print("DEBUG: The Vibe Counter is being destroyed!");
  // super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phase 2: The State of Affairs",),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Current Vibe Count:",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text(
              "$vibeCount",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.orange
              )
            ),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _resetVibe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200]),
                  child: const Text(
                    "Reset", style:TextStyle(color: Colors.black)),
                ),

                const SizedBox(width: 20,),

                ElevatedButton.icon(
                  onPressed: _boostVibe,
                  icon: Icon(Icons.rocket_launch),
                  label: const Text("Boost Vibe"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white
                  ),
                ),

                const SizedBox(width: 20,),

                ElevatedButton(
                  onPressed: _reduceVibe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700]),
                  child: const Text(
                    "Decrease", style:TextStyle(color: Colors.orange)),
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}