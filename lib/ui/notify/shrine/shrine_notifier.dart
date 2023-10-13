import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';
import 'package:zinjanow_app/ui/notify/shrine/current_location_notifier.dart';
import 'package:zinjanow_app/ui/state/shrine/shrine_state.dart';

final shrineNotifierProvider = StateNotifierProvider.autoDispose<ShrineNotifier, AsyncValue<List<ShrineState>>>(
  (ref) => ShrineNotifier(
    getShrineUsecase: ref.watch(getShrineUsecaseProvider),
    ref: ref
  )
);

class ShrineNotifier extends StateNotifier<AsyncValue<List<ShrineState>>> {
  final GetShrineUsecase _getShrineUsecase;
  final Ref ref;

  ShrineNotifier({
    required GetShrineUsecase getShrineUsecase,
    required this.ref
  }) : _getShrineUsecase = getShrineUsecase,
  super(const AsyncLoading()) {
    fetch();
  }

  Future<void> fetch() async {
    final currentLocation = ref.read(currentLocationProvider);
    state = await AsyncValue.guard(() async {
      final res = await _getShrineUsecase.excute(currentLocation.value!.lat, currentLocation.value!.lng);
      return res.map((e) => ShrineState.fromEntity(e)).toList();
    });
  }
}