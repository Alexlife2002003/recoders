import 'package:flutter/material.dart';
import 'package:recoders/screens/poem.dart';

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

// ... (your existing imports)

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({required this.content});

  @override
  Widget build(BuildContext context) {
    Color cardColorOuter = content.type == 'poem' ? Colors.blue : Colors.green;
    Color cardColor = Color(0xFF1A1F33);
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
              Container(
                height: 18.0, // Adjust the height as needed
                child: Text(
                  content.content,
                  style: TextStyle(fontSize: 16.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... (your existing classes and code)

class ExplorePage extends StatelessWidget {
  final List<Content> contentList = [
    Content(
      type: 'poem',
      title: 'Beautiful Sunset',
      author: 'John Doe',
      content:
          'The sun sets behind the hills, painting the sky with hues of orange and pink. A gentle breeze whispers through the trees, as nature itself applauds the beauty of the evening.',
    ),
    Content(
      type: 'story',
      title: 'The Mysterious Key',
      author: 'Jane Smith',
      content:
          'Once upon a time in a small village, there was a mysterious key that held the power to unlock hidden doors to other realms. The protagonist, a curious young adventurer named Alex, embarked on a quest to uncover the secrets behind this enigmatic key.',
    ),
    Content(
      type: 'poem',
      title: 'Moonlit Dreams',
      author: 'Alice Johnson',
      content:
          'Under the moonlight, dreams take flight. The silver glow of the moon illuminates the world, casting a magical spell that transports the dreamer into a realm of infinite possibilities and wonder.',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Forest',
      author: 'Robert ELson',
      content:
          'In a land far away, there was an enchanted forest where mythical creatures roamed freely. Deep within the heart of the forest lay a hidden treasure, guarded by ancient spirits. Brave adventurers sought to uncover the secrets that the enchanted forest held.',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Kindness',
      author: 'Will Smith',
      content:
          'In a land far away, there was an enchanted girl whose sole purpose was to spread love and kindness throughout the world. However, no matter how hard she tried, her acts of kindness went unnoticed. It became a tale of resilience and the enduring spirit of goodness in the face of indifference.',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Girl',
      author: 'Lilia Buckingham',
      content:
          'In a land far away, there was an enchanted girl with eyes that sparkled like stars. She possessed a unique ability to communicate with animals, and her bond with the creatures of the forest made her a protector of nature. The tale unfolds as she embarks on a journey to save her magical realm from an impending darkness.',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Journey',
      author: 'Robert Williams',
      content:
          'In a land far away, there was an enchanted girl named Lily. One day, she discovered a mysterious portal that transported her to a world of wonder and magic. Joined by fantastical companions, Lily embarked on an epic journey to fulfill a prophecy and restore balance to the enchanted realms.',
    ),
    Content(
      type: 'story',
      title: 'The Enchanted Discovery',
      author: 'Alexia Hernandez',
      content:
          'In a land far away, there was an enchanted girl named Emily. Her insatiable curiosity led her to a hidden library filled with ancient books of magic. As she delved into the secrets of the library, Emily uncovered a forgotten prophecy that foretold of a great adventure awaiting her.',
    ),
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
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Poema(
                                  title: contentList[index].title,
                                  author: contentList[index].author,
                                  content: contentList[index].content)));
                    },
                    child: ContentCard(content: contentList[index]));
              },
            ),
          ],
        ),
      ),
    );
  }
}
