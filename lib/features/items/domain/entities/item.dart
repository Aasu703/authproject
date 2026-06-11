import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String category;
  final String createdAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    stock,
    category,
    createdAt,
  ];
}
