import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    final List listItems = [
      Text(
        style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold
        ),
        "Welcome to Flutter UI",
      ),

      Icon(
          size: 120,
          color: Colors.blue,
          Icons.movie
      ),

      Image.network("https://cdnv2.tgdd.vn/mwg-static/common/News/1585803/hinh-nen-vo-tri-06.jpg"),

      Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Icon(
                    size: 30,
                    Icons.star
                ),
              ),
            ),

            Expanded(
              flex:6,
              child: ListTile(
                  title: const Text(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      "Movie Item"
                  ),
                  subtitle: Text(
                      style: TextStyle(fontSize: 18),
                      "This is a sample ListTile inside a Card"
                  )
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            style: TextStyle(fontSize: 29),
            "Exercise 1 - Core Widgets Demo"
        ),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemCount: listItems.length,

        itemBuilder: (context, index){
          return listItems[index];
        },

        separatorBuilder: (context, index){
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
