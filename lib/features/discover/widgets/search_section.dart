import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
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
        ],
      ),
    );
  }
}
