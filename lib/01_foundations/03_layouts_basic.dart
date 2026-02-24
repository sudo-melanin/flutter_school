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
        
          // Column is a layout widget that arranges its children in a vertical direction.
          // It takes a list of widgets as its children and displays them one after the other, from top to bottom.
          // The mainAxisSize property of the Column widget determines how much space the column should take along its main axis (vertical axis).
          // By default, the mainAxisSize is set to MainAxisSize.max, which means the column will take up all available vertical space.
          //However, if you set it to MainAxisSize.min, the column will only take up as much vertical space as needed to fit its children.

          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Mobile App Developer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            // Row is a layout widget that arranges its children in a horizontal direction.
            // It takes a list of widgets as its children and displays them one after the other, from left to right.
            // The mainAxisAlignment property of the Row widget determines how the children are aligned along the main axis (horizontal axis).
            // The mainAxisAlignment property can take several values, such as MainAxisAlignment.start, MainAxisAlignment.center,
            //MainAxisAlignment.end, MainAxisAlignment.spaceBetween, MainAxisAlignment.spaceAround, and MainAxisAlignment.spaceEvenly.

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