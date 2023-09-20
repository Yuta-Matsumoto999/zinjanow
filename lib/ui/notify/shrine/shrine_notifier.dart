import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';
import 'package:zinjanow_app/ui/state/shrine/shrine_state.dart';

final shrineNotifierProvider = StateNotifierProvider<ShrineNotifier, AsyncValue<List<ShrineState>>>(
  (ref) => ShrineNotifier(
    getShrineUsecase: ref.watch(getShrineUsecaseProvider)
  )
);

class ShrineNotifier extends StateNotifier<AsyncValue<List<ShrineState>>> {
  final GetShrineUsecase _getShrineUsecase;

  ShrineNotifier({
    required GetShrineUsecase getShrineUsecase
  }) : _getShrineUsecase = getShrineUsecase,
  super(const AsyncLoading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getShrineUsecase.excute();
      return res.map((e) => ShrineState.fromEntity(e)).toList();
    });
  }
}