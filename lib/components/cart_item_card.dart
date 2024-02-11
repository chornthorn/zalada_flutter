import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onDelete,
    required this.selected,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int quantity;
  final Function(int) onQuantityChanged;
  final Function() onDelete;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (selected)
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              PhosphorIcons.check(PhosphorIconsStyle.bold),
              color: Colors.white,
              size: 16,
            ),
          ),
        if (!selected)
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(
              right: 16,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        Container(
          width: 120,
          height: 120,
          color: Color(0xffF3F6FB),
          padding: const EdgeInsets.all(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$$price',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$$originalPrice',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          child: Icon(
                            PhosphorIcons.minus(),
                            size: 18,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('$quantity'),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          child: Icon(
                            PhosphorIcons.plus(),
                            size: 18,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // delete button
                  InkWell(
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        PhosphorIcons.trashSimple(),
                        color: Colors.redAccent,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
