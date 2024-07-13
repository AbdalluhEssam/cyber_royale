class PostModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final int count;
  final int size;
  final int active;
  final int price;
  final int discount;
  final String date;
  final int category;

  PostModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.count,
    required this.size,
    required this.active,
    required this.price,
    required this.discount,
    required this.date,
    required this.category,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['items_id'] ?? 0,
      name: json['items_name'] ?? '',
      description: json['items_desc'] ?? '',
      image: json['items_image'] ?? '',
      count: json['items_count'] ?? 0,
      size: json['size'] ?? 0,
      active: json['items_active'] ?? 0,
      price: json['items_price'] ?? 0,
      discount: json['items_descount'] ?? 0,
      date: json['items_date'] ?? '',
      category: json['items_cat'] ?? 0,
    );
  }
}
