import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_detail_usecase.dart';
import 'package:zinjanow_app/ui/notify/shrine/current_location_notifier.dart';
import 'package:zinjanow_app/ui/state/shrine/shrine_detail_state.dart';

final placeIdProvider = StateProvider<String?>((ref) => null);

final shrineDetailNotifierProvider = StateNotifierProvider.autoDispose<ShrineDetailNotifier, AsyncValue<ShrineDetailState>>(
  (ref) => ShrineDetailNotifier(
    ref: ref,
    getShrineDetailUsecase: ref.watch(getShrineDetailUsecaseProvider)
  )
);

class ShrineDetailNotifier extends StateNotifier<AsyncValue<ShrineDetailState>> {
  final Ref ref;
  final GetShrineDetailUsecase _getShrineDetailUsecase;

  ShrineDetailNotifier({
    required this.ref,
    required GetShrineDetailUsecase getShrineDetailUsecase
  }) : _getShrineDetailUsecase = getShrineDetailUsecase,
  super(const AsyncLoading()){
    fetch();
  }

  Future<void> fetch() async {
    final placeId = ref.watch(placeIdProvider);
    final currentLocation = ref.read(currentLocationProvider);
    state = await AsyncValue.guard(() async {
      final res = await  _getShrineDetailUsecase.excute(placeId, currentLocation.value!.lat, currentLocation.value!.lng);
      return ShrineDetailState.fromEntity(res);
    });
  }
}