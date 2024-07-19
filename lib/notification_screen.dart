import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    'New recipe added: Avocado Toast with Egg',
    'Try our latest: Greek Yogurt Parfait',
    'New in brunch: Avocado Salad',
    'Healthy choice: Vegetable Stir Fry',
    'Breakfast special: Simple Breakfast',
    'Don’t miss out on our Healthy Salad',
    'Introducing Fluffy Pancakes',
    'Refresh yourself with Fruit Smoothie',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
