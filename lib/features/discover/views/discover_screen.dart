import 'package:flutter/material.dart';
import 'package:project_sanctuaryv2/features/discover/widgets/animal_card.dart';

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
  List<Animal> _filteredAnimals = [];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _animalFuture = _animalService.fetchAnimals();

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 240),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  hintText: 'Search Animals...',
                  leading: const Icon(Icons.search),
                  controller: _searchController,
                  elevation: WidgetStateProperty.all(2.0),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  trailing: [
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  spacing: 8.0,
                  children: [
                    FilterChip(
                      label: Text('All species'),
                      selected: true,
                      onSelected: (_) {},
                      selectedColor: const Color.fromARGB(255, 17, 17, 17),
                      labelStyle: TextStyle(color: Colors.white),
                      shape: const StadiumBorder(),
                    ),
                    FilterChip(
                      label: Text('Birds'),
                      selected: false,
                      onSelected: (_) {},
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    FilterChip(
                      label: Text('Mammals'),
                      selected: false,
                      onSelected: (_) {},
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    FilterChip(
                      label: Text('Reptiles'),
                      selected: false,
                      onSelected: (_) {},
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    FilterChip(
                      label: Text('Arachnids'),
                      selected: false,
                      onSelected: (_) {},
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                  ],
                ),
                const SizedBox(height: 16,)
              ],
            ),
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


                  if (_searchQuery.isEmpty) {
                    _filteredAnimals = animals;
                  } else {
                    final query = _searchQuery.toLowerCase();

                    _filteredAnimals = animals
                        .where(
                          (animal) =>
                              animal.commonName.toLowerCase().contains(query) ||
                              animal.scientificName.toLowerCase().contains(query),
                        )
                        .toList();
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _filteredAnimals.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 300,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final animal = _filteredAnimals[index];
                      return AnimalCard(
                        imageUrl: animal.imageUrl,
                        classification: animal.classification,
                        commonName: animal.commonName,
                        scientificName: animal.scientificName,
                        location: animal.location,
                        iucnStatus: animal.iucnStatus,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
