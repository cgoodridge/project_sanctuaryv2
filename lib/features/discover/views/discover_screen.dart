import 'package:flutter/material.dart';
import 'package:project_sanctuaryv2/features/discover/widgets/animal_card.dart';
import 'package:project_sanctuaryv2/features/discover/widgets/search_section.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  DiscoverScreenState createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '248 Species',
                style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
              ),
              Text(
                'Discover the world\'s wild places.',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'This is where you can discover new content.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SearchSection(),
          AnimalCard(imageUrl: 'null', classification: 'classification', commonName: 'commonName', scientificName: 'scientificName', location: 'location', iucnStatus: 'iucnStatus')
        ],
      ),
    );
  }
}
