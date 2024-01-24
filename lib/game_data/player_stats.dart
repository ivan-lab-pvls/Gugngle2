import 'dart:async';

class PlayerStats
{
  static double life = 100;
  static double energy = 100;

  static final _lifeController = StreamController<double>.broadcast();
  static final _energyController = StreamController<double>.broadcast();

  static Stream<double> get lifeStream => _lifeController.stream;
  static Stream<double> get energyStream => _energyController.stream;

  static void increaseLife(double amount) {
    life += amount;
    if (life > 100) life = 100;
    _lifeController.add(life);
  }

  static void decreaseLife(double amount) {
    life -= amount;
    if (life < 0) life = 0;
    _lifeController.add(life);
  }

  static void increaseEnergy(double amount) {
    energy += amount;
    if (energy > 100) energy = 100;
    _energyController.add(energy);
  }

  static void decreaseEnergy(double amount) {
    energy -= amount;
    if (energy < 0) energy = 0;
    _energyController.add(energy);
  }
}