import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/planet.dart';

class PlanetForm extends StatefulWidget {
  final Planet? planet;

  const PlanetForm({super.key, this.planet});

  @override
  _PlanetFormState createState() => _PlanetFormState();
}

class _PlanetFormState extends State<PlanetForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _distanceController = TextEditingController();
  final _sizeController = TextEditingController();
  final _nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.planet != null) {
      _nameController.text = widget.planet!.name;
      _distanceController.text = widget.planet!.distance.toString();
      _sizeController.text = widget.planet!.size.toString();
      _nicknameController.text = widget.planet!.nickname ?? '';
    }
  }

  void _savePlanet() async {
    if (!_formKey.currentState!.validate()) return;

    final planet = Planet(
      id: widget.planet?.id,
      name: _nameController.text,
      distance: double.parse(_distanceController.text),
      size: double.parse(_sizeController.text),
      nickname: _nicknameController.text.isNotEmpty ? _nicknameController.text : null,
    );

    if (widget.planet == null) {
      await DatabaseHelper.instance.createPlanet(planet);
    } else {
      await DatabaseHelper.instance.updatePlanet(planet);
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.planet == null ? "Adicionar Planeta" : "Editar Planeta")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: "Nome do Planeta")),
              TextFormField(controller: _distanceController, decoration: const InputDecoration(labelText: "Distância do Sol (UA)")),
              TextFormField(controller: _sizeController, decoration: const InputDecoration(labelText: "Tamanho (km)")),
              TextFormField(controller: _nicknameController, decoration: const InputDecoration(labelText: "Apelido (Opcional)")),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _savePlanet, child: const Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}
