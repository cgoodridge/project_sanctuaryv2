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
        width: 200,
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
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                        ],
                        stops: const [0.45, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.65),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.55],
                      ),
                    ),
                  ),
                ),
              ),
              // Classification chip
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(179, 117, 117, 117), width: 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    classification.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
              // Content at the bottom
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      Divider(color: Colors.white70, thickness: 1),
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
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
