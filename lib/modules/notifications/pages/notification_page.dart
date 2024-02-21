import 'package:flutter/material.dart';
import 'package:zalada_flutter/modules/notifications/widgets/item_notification.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static const routePath = '/notification';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemNotification();
        },
      ),
    );
  }
}
