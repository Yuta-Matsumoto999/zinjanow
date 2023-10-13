import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_current_location_usecase.dart';
import 'package:zinjanow_app/ui/state/shrine/current_location_state.dart';

final currentLocationProvider = StateNotifierProvider<CurrentLocationNotifier, AsyncValue<CurrentLocationState>>(
  (ref) => CurrentLocationNotifier(
    getCurrentLocationUsecase: ref.watch(getCurrentLocationUsecaseProvider)
  )
);

class CurrentLocationNotifier extends StateNotifier<AsyncValue<CurrentLocationState>> {
  final GetCurrentLocationUsecase _getCurrentLocationUsecase;

  CurrentLocationNotifier({
    required GetCurrentLocationUsecase getCurrentLocationUsecase
  }) : _getCurrentLocationUsecase = getCurrentLocationUsecase,
  super(const AsyncLoading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getCurrentLocationUsecase.excute();
      return CurrentLocationState.fromEntity(res);
    });
  }

}