import 'package:zinjanow_app/domain/entity/shrine.dart';
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
  Future<List<Shrine>> getShrines() async {
    try {
      final res = await _googleShrineDatasource.getShrines();
      return res.results!.map((e) => 
        _shrineFactory.createFromModel(e)
      ).toList();
    } catch (err) {
      throw Exception();
    }
  }
}