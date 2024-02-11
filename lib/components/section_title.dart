import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key, required this.title, this.action, this.onAction});

  final String title;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18,
            ),
          ),
          if (action != null)
            InkWell(
              onTap: onAction,
              child: Text(
                action ?? '',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
