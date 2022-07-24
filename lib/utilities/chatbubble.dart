// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isItMe;
  ChatBubble({required this.sender, required this.text, required this.isItMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: isItMe == true
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              isItMe == true ? 'You' : sender,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black54, fontSize: 13.0),
            ),
            SizedBox(
              height: 3.5,
            ),
            Material(
              color: isItMe == false ? Color.fromRGBO(129, 215, 255, 1) : Colors.white70,
              elevation: 4.0,
              // ignore: prefer_const_constructors
              borderRadius: isItMe == true
                  ? BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    '$text ',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        // color: isItMe == false ? Colors.white : Colors.black,
                        // fontWeight: isItMe==false ? FontWeight.w800 : FontWeight.normal),
                        fontWeight: FontWeight.normal),
                  )),
            ),
          ]),
    );
  }
}
