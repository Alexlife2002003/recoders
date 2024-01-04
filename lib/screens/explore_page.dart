import 'package:flutter/material.dart';

class Content {
  final String type;
  final String title;
  final String author;
  final String content;

  Content({
    required this.type,
    required this.title,
    required this.author,
    required this.content,
  });
}

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({required this.content});

  @override
  Widget build(BuildContext context) {
    //Color cardColor = content.type == 'poem' ? Color(0xFF1A1F33) : Colors.red;
    Color cardColorOuter = content.type == 'poem' ? Colors.blue : Colors.green;
    Color cardColor=Color(0xFF1A1F33);
    return Card(
      elevation: 3.0,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(
            color: cardColorOuter,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content.type == 'poem' ? 'Poem' : 'Short Story',
                style: TextStyle(
                  color: content.type == 'poem' ? Colors.blue : Colors.green,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                content.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'By ${content.author}',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              SizedBox(height: 12.0),
              Text(
                content.content,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  final List<Content> contentList = [
    Content(
      type: 'poem',
      title: 'Beautiful Sunset',
      author: 'John Doe',
      content: 'The sun sets behind the hills...',
    ),
    Content(
      type: 'story',
      title: 'The Mysterious Key',
      author: 'Jane Smith',
      content: 'Once upon a time in a small village...',
    ),
    Content(
      type: 'poem',
      title: 'Moonlit Dreams',
      author: 'Alice Johnson',
      content: 'Under the moonlight, dreams take flight...',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Forest',
      author: 'Robert Williams',
      content: 'In a land far away, there was an enchanted forest...',
    ),
     Content(
      type: 'story',
      title: 'The Enchanted Girl',
      author: 'Robert Williams',
      content: 'In a land far away, there was an enchanted girl...',
    ),
    // Add more poems and stories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contentList.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemBuilder: (context, index) {
                return ContentCard(content: contentList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

