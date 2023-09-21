import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';

class GetShrineUsecseImpl implements GetShrineUsecase {
  final GetShrineRepository _getShrineRepository;
  final GetCurrentLocationRepository _getCurrentLocationRepository;

  GetShrineUsecseImpl({
    required GetShrineRepository getShrineRepository,
    required GetCurrentLocationRepository getCurrentLocationRepository
  }) : _getShrineRepository = getShrineRepository,
  _getCurrentLocationRepository = getCurrentLocationRepository;

  @override
  Future<List<Shrine>> excute() async {
    try {
      // 現在地の取得
      final position = await _getCurrentLocationRepository.getCurrentLocation();

      // 神社の検索結果取得
      return await _getShrineRepository.getShrines(position.lat, position.lng);

    } catch(err) {
      throw Exception();
    }
    
  }
}