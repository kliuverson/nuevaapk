import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black, // Fondo oscuro
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.deepPurpleAccent, // Color personalizado
              strokeWidth: 4,
            ),
            SizedBox(height: 20),
            Text(
              'Cargando...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
