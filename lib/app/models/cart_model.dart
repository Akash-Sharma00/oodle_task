import 'dart:convert';

class CartModel {
  final String path;
  final String price;
  CartModel({
    required this.path,
    required this.price,
  });

  CartModel copyWith({
    String? path,
    String? price,
  }) {
    return CartModel(
      path: path ?? this.path,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'price': price,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      path: map['path'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(path: $path, price: $price)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.path == path &&
      other.price == price;
  }

  @override
  int get hashCode => path.hashCode ^ price.hashCode;
}
