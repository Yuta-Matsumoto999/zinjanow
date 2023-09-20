import 'package:zinjanow_app/domain/entity/shrine.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';
import 'package:zinjanow_app/domain/usecase/shrine/get_shrine_usecase.dart';

class GetShrineUsecseImpl implements GetShrineUsecase {
  final GetShrineRepository _getShrineRepository;

  GetShrineUsecseImpl({
    required GetShrineRepository getShrineRepository
  }) : _getShrineRepository = getShrineRepository;

  @override
  Future<List<Shrine>> excute() async {
    return _getShrineRepository.getShrines();
  }
}