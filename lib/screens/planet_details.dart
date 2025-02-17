// lib/screens/planet_details.dart

import 'package:flutter/material.dart';
import '../models/planet.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  const PlanetDetails({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(planet.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${planet.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (planet.nickname != null && planet.nickname!.isNotEmpty)
              Text(
                'Apelido: ${planet.nickname}',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 10),
            Text(
              'Distância do Sol: ${planet.distance} UA',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Tamanho: ${planet.size} km',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
