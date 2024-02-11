import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Category {
  final String name;

  @Deprecated(
      'Use iconData instead,This is will be removed in the next version v2.0')
  final IconData icon;

  const Category({
    required this.name,
    required this.icon,
  });
}

final List<Category> categories = [
  Category(name: 'Electronics', icon: PhosphorIcons.phone()),
  Category(name: 'Accessories', icon: PhosphorIcons.laptop()),
  Category(name: 'Clothing', icon: PhosphorIcons.tShirt()),
  Category(name: 'Shoes', icon: PhosphorIcons.sneaker()),
];
