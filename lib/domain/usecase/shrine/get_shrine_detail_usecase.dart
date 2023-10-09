import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/shrine/get_shrine_detail_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_detail_repository.dart';

final getShrineDetailUsecaseProvider = Provider<GetShrineDetailUsecase>(
  (ref) => GetShrineDetailUsecaseImpl(
    getShrineDetailRepository: ref.read(getShrineDetailRepositoryProvider),
    getCurrentLocationRepository: ref.read(getCurrentLocationProvider),
    getDistanceRepository: ref.read(getDistanceRepositoryProvider)
  )
);

abstract class GetShrineDetailUsecase {
  Future<ShrineDetail> excute(placeId);
}