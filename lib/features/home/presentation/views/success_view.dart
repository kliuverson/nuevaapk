import 'package:flutter/material.dart';

import '../../../data/models/user.dart';
import '../widgets/balance_widget.dart';

class Success extends StatelessWidget {
  final User user;
  
  const Success({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Balance(user),  
    );
  }
}

