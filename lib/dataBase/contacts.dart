class Contact {
  final String name;
  final String number;
  final String image;

  Contact({required this.name, required this.number, required this.image});

  Map<String, dynamic> toMap() {
    return {'name': name, 'number': number, 'image': image};
  }
}
