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
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
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
                selectedColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
              ),
              FilterChip(
                label: Text('Birds'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
              ),
              FilterChip(
                label: Text('Mammals'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
              ),
              FilterChip(
                label: Text('Reptiles'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
              ),
              FilterChip(
                label: Text('Arachnids'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}