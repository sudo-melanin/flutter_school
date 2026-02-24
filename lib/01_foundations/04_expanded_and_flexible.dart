import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      home: FlexLesson(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class FlexLesson extends StatelessWidget {
  const FlexLesson({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanded and Flexible"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green[300],
                  child: const Icon(Icons.image, size: 50),
              ),
                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const[
                      Text(
                        "UPDATE: Newest Flutter Developer is here!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(height: 5),
                      Text(
                        "Transitioning from flutterflow, I have decided to have total ownership of code, I'm learnig dart and flutter to that effect",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                    )
                    ],
                  )
                )
              ],
              ),
              const SizedBox(height: 20),
              const Text(
                '''
                  Flexible and Expanded are two widgets in Flutter that are used to control the layout of child widgets
                   within a Row, Column, or Flex widget. They both allow you to specify how much space a child widget should take up relative to its siblings,
                   but they have some differences in behavior.
                   In summary, Flexible is more flexible and allows for dynamic resizing, while Expanded is more rigid and forces a child widget to fill all available space.
                   ''',
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 16, color: Colors.grey),),
              const SizedBox(height: 10),
             Row(
              children: [
                 Flexible(
                  child: Container(
                  color: Colors.blue,
                  child: const Text("This is flexible container")
                )
                ),

                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: const Text ("This is expanded container, it can fill up space")
                  )
                )
              ],
             )
            ],
          )
      ),
    );
  }
}