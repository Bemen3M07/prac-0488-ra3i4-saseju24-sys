import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampooProvider.dart';
import 'pantalla1.dart';
import 'pantalla2.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ShampooProvider(),child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Flutter Shampoo App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const pantalla1(),
        '/detalle': (context) => const pantalla2(),
      },
    );
  }
}
