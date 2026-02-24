import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MarketGist(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class MarketGist extends StatelessWidget{
  const MarketGist({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market Gist"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.green[100],
                  child: Icon(Icons.person, color: Colors.green, size: 60,),
                ),
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check_circle, color: Colors.blue, size: 25),
                )
              ],
            )
          ),
          const SizedBox(height: 15),
          const Text(
            "Melaninman FlutterDev",
            style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            "Lagos, Nigeria",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Row and Expanded

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _buildStateItem("Posts", "128"),
                _buildStateItem("Followers", "6.4k"),
                _buildStateItem("Vibe", "Top Rated")
              ],
            )
          ),
          const SizedBox(height: 20),

          // Container

          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Transitioning from no-code. Building Market Gist brick by brick. Love football and high performance apps.",
              textAlign: TextAlign.center,
            ),
          )
        ],
      )
    );
  }

  // A helper function
  Widget _buildStateItem(String label, String value){
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      )
    );
  }
}