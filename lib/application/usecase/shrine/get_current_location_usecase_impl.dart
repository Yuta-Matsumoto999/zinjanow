import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_current_location_usecase.dart';

class GetCurrentLcoationUsecaseImpl implements GetCurrentLocationUsecase {

  final GetCurrentLocationRepository _getCurrentLocationRepository;

  GetCurrentLcoationUsecaseImpl({
    required GetCurrentLocationRepository getCurrentLocationRepository
  }) : _getCurrentLocationRepository = getCurrentLocationRepository;
  
  @override
  Future<CurrentLocation> excute() async {
    try {
      return await _getCurrentLocationRepository.getCurrentLocation();
    } catch(err) {
      throw Exception();
    }
  }
}