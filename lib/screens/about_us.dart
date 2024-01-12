import 'package:flutter/material.dart';

class Person {
  final String name;
  final String role;
  final String details;

  Person({
    required this.name,
    required this.role,
    required this.details,
  });
}

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<String> years = ['2021', '2022', '2023'];
  final Map<String, List<Person>> peopleByYear = {
    '2021': [
      Person(name: 'Person A', role: 'Developer', details: 'Details about Person A'),
      Person(name: 'Person B', role: 'Designer', details: 'Details about Person B'),
      Person(name: 'Person C', role: 'Tester', details: 'Details about Person C'),
    ],
    '2022': [
      Person(name: 'Person X', role: 'Developer', details: 'Details about Person X'),
      Person(name: 'Person Y', role: 'Designer', details: 'Details about Person Y'),
      Person(name: 'Person Z', role: 'Tester', details: 'Details about Person Z'),
    ],
    '2023': [
      Person(name: 'Person M', role: 'Developer', details: 'Details about Person M'),
      Person(name: 'Person N', role: 'Designer', details: 'Details about Person N'),
      Person(name: 'Person O', role: 'Tester', details: 'Details about Person O'),
    ],
  };

  Widget _buildYearContainer(String year) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YearDetailsPage(
              year: year,
              people: peopleByYear[year] ?? [],
            ),
          ),
        );
      },
      child: Container(
        width: 160.0,
        height: 160.0,
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 4.0,
          ),
          color: const Color(0xff232c4d),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            year,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F33),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Our Journey',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            for (String year in years) _buildYearContainer(year),
          ],
        ),
      ),
    );
  }
}

class YearDetailsPage extends StatelessWidget {
  final String year;
  final List<Person> people;

  const YearDetailsPage({
    Key? key,
    required this.year,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Year $year'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details for the year $year',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            for (Person person in people)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${person.name}',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    Text('Role: ${person.role}',style: TextStyle(color: Colors.black),),
                    Text('Details: ${person.details}',style: TextStyle(color: Colors.black),),
                    const Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

