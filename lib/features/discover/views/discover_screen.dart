import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    const Color primaryTextColor = Color(0xFF1E1E1E);
    const Color accentOrange = Color(0xFFE85D04);
    const Color mutedTextColor = Color(0xFF5C5C5C);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 240),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FutureBuilder<List<Animal>>(
                          future: _animalFuture,
                          builder: (context, snapshot) {
                            final speciesCount = snapshot.data?.length ?? 0;
                            return Text(
                              'FIELD GUIDE . $speciesCount Species',
                              style: GoogleFonts.inter(
                                color: accentOrange,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Discover the world\'s wild animals!',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 56,
                            fontWeight: FontWeight.w700,
                            height: 1.08,
                            letterSpacing: -0.5,
                            color: primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 1.5,
                            height: 36,
                            color: accentOrange,
                          ),

                          const SizedBox(width: 16),

                          Flexible(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 280),
                              child: Text(
                                'Explore incredible species, and the places they call home.',
                                style: GoogleFonts.inter(
                                  color: mutedTextColor,
                                  fontSize: 13,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBar(
                    hintText: 'Search Animals...',
                    leading: const Icon(Icons.search),
                    controller: _searchController,
                    backgroundColor: WidgetStateProperty.all(Colors.white),
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
                  const SizedBox(height: 16),
                ],
              ),
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
                              animal.scientificName.toLowerCase().contains(
                                query,
                              ),
                        )
                        .toList();
                  }

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: _filteredAnimals.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisExtent: 300,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final animal = _filteredAnimals[index];
                          return AnimalCard(animal: animal);
                        },
                      ),
                    ),
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
