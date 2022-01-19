class Artiles {
  final String id;
  final String name;
  final double price;
  final String image;
  final List<String>detail;
  bool isFavoris;
  Artiles({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.detail,
    this.isFavoris = false,
  });

}
