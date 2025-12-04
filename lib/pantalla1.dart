import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampooProvider.dart';
import 'shampoo.dart';

class pantalla1 extends StatelessWidget {
  const pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ShampooProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona un shampoo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<Shampoo>(
              value: prov.shampooSeleccionado,
              isExpanded: true,
              items: prov.shampoos
                  .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text('${s.marca} — ${s.quantitat.toStringAsFixed(0)} ml'),
                      ))
                  .toList(),
              onChanged: (s) {
                if (s != null) prov.canviarShampoo(s);
              },
            ),

            const SizedBox(height: 8),

            // nombre del shampoo seleccionado
            Text(
              prov.shampooSeleccionado.marca,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detalle');
              },
              child: const Text('Ir a detalles'),
            ),
          ],
        ),
      ),
    );
  }
}
