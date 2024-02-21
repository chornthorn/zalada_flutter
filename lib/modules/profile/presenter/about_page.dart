import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  static const routePath = '/about-page';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About Zalada'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Zalada is a food delivery app that connects you with the best local restaurants.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
