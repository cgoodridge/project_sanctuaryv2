class Animal {
  final String id;
  final String imageUrl;
  final String classification;
  final String commonName;
  final String scientificName;
  final String location;
  final String iucnStatus;
  final String diet;
  final String description;
//   final String habitat;
  final String genus;
  final String family;
  final String kingdom;
  final String phylum;
  final String order;
  final String? suborder;
  final String nameOfYoung;
  final String lifestyle;

  const Animal({
    required this.id,
    required this.imageUrl,
    required this.classification,
    required this.commonName,
    required this.scientificName,
    required this.location,
    required this.iucnStatus,
    required this.diet,
    required this.description,
    // required this.habitat,
    required this.genus,
    required this.family,
    required this.kingdom,
    required this.phylum,
    required this.order,
    this.suborder,
    required this.nameOfYoung,
    required this.lifestyle,
  });

  factory Animal.fromMap(String id, Map<String, dynamic> data) {
    String readString(String field) {
      final value = data[field];
      if (value is String) return value;
      throw FormatException('Animal "$id" has a missing or invalid "$field"');
    }

    return Animal(
      id: id,
      imageUrl: readString('imageUrl'),
      classification: readString('kingdomClass'),
      commonName: readString('commonName'),
      scientificName: readString('scientificName'),
      location: readString('location'),
      iucnStatus: readString('redListStatus'),
      diet: readString('diet'),
      description: readString('description'),
    //   habitat: readString('habitat'),
      genus: readString('genus'),
      family: readString('family'),
      kingdom: readString('kingdom'),
      phylum: readString('phylum'),
      order: readString('order'),
      suborder: data['suborder'] as String?,
      nameOfYoung: readString('nameOfYoung'),
      lifestyle: readString('lifestyle')
    );
  }
}