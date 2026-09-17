import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      child: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.asset('asserts/images/Mimi.jpg', fit: BoxFit.fill),
          ),

          Text('Name: Mimi'),
          Text('Price: Free'),
          Text('Description: Mimi is a cute cat!'),
        ],
      ),
    );

    // return Center(
    //   child: RichText(
    //     text: TextSpan(
    //       text: "Xin chao ",
    //       style: TextStyle(color: Colors.blue, fontSize: 25),
    //       children: <TextSpan> [
    //         TextSpan(
    //             text: "cac ban",
    //             style: TextStyle(color: Colors.red, fontSize: 20)
    //         ),
    //       ]
    //     )
    //   )
    // );
  }
}
