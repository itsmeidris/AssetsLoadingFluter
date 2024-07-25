// ignore: file_names
// ignore_for_file: unused_element

class Shoeproduct {
  final int id;
  final String name;
  final String description;
  final double price;
  final String? image;

  Shoeproduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  //The ProductData.fromJson() factory constructor allows you to create
  //ProductData instances from the JSON data. You can then use this class
  //to load and display the product data in your Flutter application.
  factory Shoeproduct.fromJson(Map<String, dynamic> json) {
    return Shoeproduct(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'].toDouble(),
        image: json['imageUrl']);
  }
}
