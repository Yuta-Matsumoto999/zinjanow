import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';

class GetShrineUsecseImpl implements GetShrineUsecase {
  final GetShrineRepository _getShrineRepository;
  final GetCurrentLocationRepository _getCurrentLocationRepository;
  final GetDistanceRepository _getDistanceRepository;

  GetShrineUsecseImpl({
    required GetShrineRepository getShrineRepository,
    required GetCurrentLocationRepository getCurrentLocationRepository,
    required GetDistanceRepository getDistanceRepository
  }) : _getShrineRepository = getShrineRepository,
  _getCurrentLocationRepository = getCurrentLocationRepository,
  _getDistanceRepository = getDistanceRepository;

  @override
  Future<List<Shrine>> excute() async {
    try {
      // 現在地の取得
      final position = await _getCurrentLocationRepository.getCurrentLocation();

      // 神社の検索結果取得
      final shrines = await _getShrineRepository.getShrines(position.lat, position.lng);

      for(Shrine e in shrines) {
        final res = await _getDistanceRepository.getDistance(position.lat, position.lng, e.lat, e.lng);

        e.duration = res.duration;
        e.distance = res.distance;
      }

      return shrines;
      
    } catch(err) {
      throw Exception();
    }
    
  }
}