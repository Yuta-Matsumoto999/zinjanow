import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_factory.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_shrine_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';

class GetShrineRepositoryImpl implements GetShrineRepository {
  final GoogleShrineDatasource _googleShrineDatasource;
  final ShrineFactory _shrineFactory;

  GetShrineRepositoryImpl({
    required GoogleShrineDatasource googleShrineDatasource,
    required ShrineFactory shrineFactory
  }) : _googleShrineDatasource = googleShrineDatasource,
  _shrineFactory = shrineFactory;

  @override
  Future<List<Shrine>> getShrines(lat, lng) async {
    try {
      final res = await _googleShrineDatasource.getShrines(lat, lng);
      return res.results!.map((e) => 
        _shrineFactory.createFromModel(e)
      ).toList();
    } catch (err) {
      throw Exception();
    }
  }
}