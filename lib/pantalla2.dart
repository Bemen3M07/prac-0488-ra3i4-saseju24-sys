import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampooProvider.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({super.key});

  @override
  State<pantalla2> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<pantalla2> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<shampooProvider>(context);
    final s = provider.shampooSeleccionado;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del shampoo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marca: ${s.marca}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Cantidad original: ${s.quantitat} l'),
            const SizedBox(height: 8),
            Text('Queda: ${provider.restant} ml'),
            const SizedBox(height: 8),
            Text('Gastado: ${provider.consumit} ml'),
            const SizedBox(height: 8),
            Text('Dosis gastadas: ${provider.dosisConsumidas} (1 dosis = ${shampooProvider.dosis} ml)'),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.restant > 0 ? () => provider.usarDosis() : null,
                child: Text(provider.restant > 0
                    ? 'Usar 1 dosis (${shampooProvider.dosis.toStringAsFixed(0)} ml)'
                    : 'No queda shampoo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
