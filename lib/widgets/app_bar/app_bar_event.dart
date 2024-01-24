part of 'app_bar_bloc.dart';

@immutable
abstract class AppBarEvent {}

class UpdateLife extends AppBarEvent {
  final double life;

  UpdateLife(this.life);
}

class UpdateEnergy extends AppBarEvent {
  final double energy;

  UpdateEnergy(this.energy);
}
