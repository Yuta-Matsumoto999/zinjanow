import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';

class GetShrineUsecseImpl implements GetShrineUsecase {
  final GetShrineRepository _getShrineRepository;
  final GetDistanceRepository _getDistanceRepository;

  GetShrineUsecseImpl({
    required GetShrineRepository getShrineRepository,
    required GetDistanceRepository getDistanceRepository
  }) : _getShrineRepository = getShrineRepository,
  _getDistanceRepository = getDistanceRepository;

  @override
  Future<List<Shrine>> excute(lat, lng) async {
    try {
      // 神社の検索結果取得
      final shrines = await _getShrineRepository.getShrines(lat, lng);

      for(Shrine e in shrines) {
        final res = await _getDistanceRepository.getDistance(lat, lng, e.lat, e.lng);

        e.duration = res.duration;
        e.distance = res.distance;
      }

      return shrines;
      
    } catch(err) {
      throw Exception();
    }
    
  }
}