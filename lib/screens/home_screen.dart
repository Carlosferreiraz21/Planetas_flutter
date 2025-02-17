import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/planet.dart';
import 'planet_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Planet>> _planets;

  @override
  void initState() {
    super.initState();
    _refreshPlanets();
  }

  void _refreshPlanets() {
    setState(() {
      _planets = DatabaseHelper.instance.readAllPlanets();
    });
  }

  /// Exibe um alerta para confirmar exclusão
  Future<void> _confirmDelete(int id) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Excluir Planeta"),
        content: const Text("Tem certeza que deseja excluir este planeta?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Excluir", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      _deletePlanet(id);
    }
  }

  void _deletePlanet(int id) async {
    await DatabaseHelper.instance.deletePlanet(id);
    _refreshPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planetas')),
      body: FutureBuilder<List<Planet>>(
        future: _planets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum planeta cadastrado.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final planet = snapshot.data![index];
              return ListTile(
                title: Text(planet.name),
                subtitle: Text(planet.nickname ?? 'Sem apelido'),
                onTap: () async {
                  bool? result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetForm(planet: planet),
                    ),
                  );
                  if (result == true) {
                    _refreshPlanets();
                  }
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete(planet.id!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          bool? result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlanetForm()),
          );
          if (result == true) {
            _refreshPlanets();
          }
        },
      ),
    );
  }
}
