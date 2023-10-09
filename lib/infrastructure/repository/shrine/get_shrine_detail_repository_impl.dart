import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_detail_factory.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_detail_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';

class GetShrineDetailRepositoryImpl implements GetShrineDetailRepository {
  final GoogleShrineDatasource _googleShrineDatasource;
  final ShrineDetailFactory _shrineDetailFactory;

GetShrineDetailRepositoryImpl({
  required GoogleShrineDatasource googleShrineDatasource,
  required ShrineDetailFactory shrineDetailFactory
}) : _googleShrineDatasource = googleShrineDatasource,
_shrineDetailFactory = shrineDetailFactory;

  @override
  Future<ShrineDetail> getShrineDetail(placeId) async {
    try {
      final res = await _googleShrineDatasource.getShrineDetail(placeId);
      return _shrineDetailFactory.createFromModel(res);
    } catch (err) {
      throw Exception();
    }
  }
}