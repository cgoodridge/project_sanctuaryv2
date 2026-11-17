import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  final String imageUrl;
  final String classification;
  final String commonName;
  final String scientificName;
  final String location;
  final String iucnStatus;

  const AnimalCard({
    super.key,
    required this.imageUrl,
    required this.classification,
    required this.commonName,
    required this.scientificName,
    required this.location,
    required this.iucnStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        height: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              // Classification chip
              Positioned(
                top: 8,
                left: 8,
                child: Chip(
                  label: Text(
                    classification,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black.withOpacity(0.7),
                ),
              ),
              // Content at the bottom
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Common name
                    Text(
                      commonName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Scientific name
                    Text(
                      scientificName,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Divider
                    Divider(
                      color: Colors.white70,
                      thickness: 1,
                    ),
                    const SizedBox(height: 4),
                    // Location and IUCN status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Location with icon
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        // IUCN status
                        Text(
                          iucnStatus,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}