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
  Category(name: 'Phone', icon: PhosphorIcons.deviceMobile()),
  Category(name: 'Computers', icon: PhosphorIcons.laptop()),
  Category(name: 'Speakers', icon: PhosphorIcons.speakerHifi()),
  Category(name: 'Monitor', icon: PhosphorIcons.monitor()),
  Category(name: 'HeadPhone', icon: PhosphorIcons.headphones()),
  Category(name: 'Mouses', icon: PhosphorIcons.mouse()),
  Category(name: 'Microphone', icon: PhosphorIcons.microphone()),
  Category(name: 'Keyboard', icon: PhosphorIcons.keyboard()),
];
