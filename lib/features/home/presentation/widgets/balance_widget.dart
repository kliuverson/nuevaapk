import 'package:flutter/material.dart';

import '../../../data/models/user.dart';

class Balance extends StatelessWidget {
  final User user;
  const Balance(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Saldo'),
        Text('${user.id}'),
        Text(user.body)
      ],
    );
  }
}