import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class ViewOrderPage extends StatefulWidget {
  const ViewOrderPage({super.key});

  static const String routePath = '/view-order';

  @override
  State<ViewOrderPage> createState() => _ViewOrderPageState();
}

class _ViewOrderPageState extends State<ViewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Order',
      ),
      body: const Center(
        child: Text('View Order Page'),
      ),
    );
  }
}
