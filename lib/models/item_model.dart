class ItemModel {
  final int id;
  final String name;
  final String image;
  final double price;
  const ItemModel({required this.id, required this.name, required this.image, required this.price});
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
} 