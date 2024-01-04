import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future<void> _launchUrl(String url) async {
      try {
        if (!await launchUrl(Uri.parse(url),
            mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch');
        }
      } catch (e) {
        print("$e");
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 3.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    'lib/assets/logo.jpeg',
                    width: screenWidth - 50,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'We are students in the Foreign Language Degree Program (LILEX) of the Autonomous University of Zacatecas, Mexico. We are specializing in translation from English, French, German and Italian into Spanish. We love everything involving language and are also interested in inverse translation as an academic exercise. With this blog, we hope to not only practice and improve our translation skills, but to encourage students in other areas to share their creative writing and ideas with the world through translation. We also wish to create an ongoing dialogue among students and professionals involved in literary translation and literary creation.',
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://www.facebook.com/recoderszac'));
                    },
                    icon: Image.asset(
                      'lib/assets/facebook.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://www.instagram.com/re_coders/'));
                    },
                    icon: Image.asset(
                      'lib/assets/instagram.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://twitter.com/Recoderszac'));
                    },
                    icon: Image.asset(
                      'lib/assets/X.png', // Adjust the path accordingly
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
