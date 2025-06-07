import 'package:flutter/material.dart';
import '../../../data/models/user.dart';

class Success extends StatelessWidget {
  final List<User> users;

  Success({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios aleatorios'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
            ),
          );
        },
      ),
    );
  }
}
