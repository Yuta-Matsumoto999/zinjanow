import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/shrine/get_current_location_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';

final getCurrentLocationUsecaseProvider = Provider<GetCurrentLocationUsecase>(
  (ref) => GetCurrentLcoationUsecaseImpl(
    getCurrentLocationRepository: ref.watch(getCurrentLocationRepositoryProvider)
  )
);

abstract class GetCurrentLocationUsecase {
  Future<CurrentLocation> excute();
}