import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampooProvider.dart';

class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
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
            Text('Cantidad original: ${s.quantitat.toStringAsFixed(1)} ml'),
            const SizedBox(height: 8),
            Text('Queda: ${provider.remaining.toStringAsFixed(1)} ml'),
            const SizedBox(height: 8),
            Text('Gastado: ${provider.consumedMl.toStringAsFixed(1)} ml'),
            const SizedBox(height: 8),
            Text('Dosis gastadas: ${provider.consumedDoses} (1 dosis = ${shampooProvider.doseMl.toStringAsFixed(0)} ml)'),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.remaining > 0 ? () => provider.usarDosis() : null,
                child: Text(provider.remaining > 0
                    ? 'Usar 1 dosis (${shampooProvider.doseMl.toStringAsFixed(0)} ml)'
                    : 'No queda shampoo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
