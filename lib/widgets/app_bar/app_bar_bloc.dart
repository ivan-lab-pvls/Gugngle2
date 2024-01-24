import 'package:bloc/bloc.dart';
import 'package:gamble/game_data/player_stats.dart';
import 'package:meta/meta.dart';

part 'app_bar_event.dart';

part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc()
      : super(AppBarState(life: PlayerStats.life, energy: PlayerStats.energy)) {

    PlayerStats.lifeStream.listen((life) {
      add(UpdateLife(life));
    });
    PlayerStats.energyStream.listen((energy) {
      add(UpdateEnergy(energy));
    });
    on<UpdateLife>((event, emit) {
      PlayerStats.life = event.life;
      emit(AppBarState(life: event.life, energy: state.energy));
    });

    on<UpdateEnergy>((event, emit) {
      PlayerStats.energy = event.energy;
      emit(AppBarState(life: state.life, energy: event.energy));
    });
  }
}
