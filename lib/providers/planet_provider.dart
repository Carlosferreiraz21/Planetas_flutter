// lib/providers/planet_provider.dart

import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/planet.dart';

class PlanetProvider with ChangeNotifier {
  List<Planet> _planets = [];
  bool _isLoading = false;

  List<Planet> get planets => _planets;
  bool get isLoading => _isLoading;

  Future<void> loadPlanets() async {
    _isLoading = true;
    notifyListeners();

    _planets = (await DatabaseHelper.instance.readAllPlanets()).cast<Planet>();
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addPlanet(Planet planet) async {
    await DatabaseHelper.instance.createPlanet(planet);
    await loadPlanets();
  }

  Future<void> updatePlanet(Planet planet) async {
    await DatabaseHelper.instance.updatePlanet(planet);
    await loadPlanets();
  }

  Future<void> deletePlanet(int id) async {
    await DatabaseHelper.instance.deletePlanet(id);
    await loadPlanets();
  }
}
