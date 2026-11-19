import 'package:flutter/material.dart';
import 'package:project_sanctuaryv2/features/discover/widgets/animal_card.dart';
import 'package:project_sanctuaryv2/features/discover/widgets/search_section.dart';

import '../data/animal_data_service.dart';
import '../data/models/animal.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  DiscoverScreenState createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  late final _animalService = AnimalDataService();
  late Future<List<Animal>> _animalFuture;

  @override
  void initState() {
    super.initState();
    _animalFuture = _animalService.fetchAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Expanded(
            child: FutureBuilder<List<Animal>>(
              future: _animalFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No animals found.');
                }

                final animals = snapshot.data!;

                return GridView.builder(
                   padding: const EdgeInsets.all(12),
                    itemCount: animals.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    return AnimalCard(
                      imageUrl: animal.imageUrl,
                      classification: animal.classification,
                      commonName: animal.commonName,
                      scientificName: animal.scientificName,
                      location: animal.location,
                      iucnStatus: animal.iucnStatus,
                    );
                  }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
