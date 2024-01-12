import 'package:flutter/material.dart';

class Poema extends StatelessWidget {
  final String title;
  final String author;
  final String content;

  Poema({
    required this.title,
    required this.author,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F33),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Written by: $author",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
