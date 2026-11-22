import 'package:flutter/material.dart';

import '../data/models/animal.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({
    super.key,
    required this.animal
  });

  static const TextStyle sectionHeadingStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.5,
    color: Color(0xFFFF8904),
  );

  static const TextStyle sectionSubHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: Color.fromARGB(255, 240, 240, 240),
  );

  static const TextStyle sectionContentStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
    color: Color.fromARGB(255, 143, 143, 143),
  );


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text(animal.scientificName)),
        backgroundColor: const Color(0xFF0B0A09),
        body: Column(
          children: [
            SizedBox(
              height: 550,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    animal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.2),
                          Colors.black.withValues(alpha: 0.8),
                          Colors.black,
                        ],
                        stops: [0.35, 0.6, 0.85, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: Colors.orangeAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orangeAccent,
              dividerColor: Color.fromARGB(255, 77, 77, 77),
              dividerHeight: 0.5,
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Classification'),
                Tab(text: 'Habitat'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'About This Species'.toUpperCase(),
                            style: sectionHeadingStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            animal.commonName,
                            style: sectionSubHeadingStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            animal.description,
                            style: sectionContentStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Classification',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              animal.kingdom,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Habitat',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              animal.lifestyle,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
