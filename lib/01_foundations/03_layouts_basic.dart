import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      home: LayoutMastery(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class LayoutMastery extends StatelessWidget {
  const LayoutMastery({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Mastery"),
        centerTitle: true,
      ),

      body: Center(

        // container is a versatile widget that allows you to create a rectangular visual element. 
        //It can be decorated with a background color, border, and other styling properties. 
        //It also provides padding and margin to control the spacing around the content.

        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.green, width: 2),
          ),
        

          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Mobile App Developer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person, color: Colors.green),
                SizedBox(width: 10),
                Text("Melanin Man", style: TextStyle(fontSize: 22)),
              ]
            ),

            const SizedBox(height: 10),
            const Text("Flutter || Dart || UI/UX Design",)

          ]

          )

        )
      )
    );
  }
}