import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_detail_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_detail_usecase.dart';

class GetShrineDetailUsecaseImpl implements GetShrineDetailUsecase {
  final GetShrineDetailRepository _getShrineDetailRepository;
  final GetCurrentLocationRepository _getCurrentLocationRepository;
  final GetDistanceRepository _getDistanceRepository;

  GetShrineDetailUsecaseImpl({
    required GetShrineDetailRepository getShrineDetailRepository,
    required GetCurrentLocationRepository getCurrentLocationRepository,
    required GetDistanceRepository getDistanceRepository

  }) : _getShrineDetailRepository = getShrineDetailRepository,
  _getCurrentLocationRepository = getCurrentLocationRepository,
  _getDistanceRepository = getDistanceRepository;

  @override
  Future<ShrineDetail> excute(placeId) async {

    try {
      // 現在地の取得
      final position = await _getCurrentLocationRepository.getCurrentLocation();

      // 神社詳細取得
      final shrine = await _getShrineDetailRepository.getShrineDetail(placeId);

      // 距離と所要時間取得
      final res = await _getDistanceRepository.getDistance(position.lat, position.lng, shrine.lat, shrine.lng);

      shrine.distance = res.distance;
      shrine.duration = res.duration;

      return shrine;
    } catch(err) {
      throw Exception();
    }
  }
}