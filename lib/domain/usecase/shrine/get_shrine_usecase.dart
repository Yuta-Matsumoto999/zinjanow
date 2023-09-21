import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/shrine/get_shrine_usecaase_impl.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';

final getShrineUsecaseProvider = Provider<GetShrineUsecase>(
  (ref) => GetShrineUsecseImpl(
    getShrineRepository: ref.watch(getShrineRepositoryProvider),
    getCurrentLocationRepository: ref.watch(getCurrentLocationProvider),
    getDistanceRepository: ref.watch(getDistanceRepositoryProvider)
  )
);

abstract class GetShrineUsecase {
  Future<List<Shrine>> excute();
}