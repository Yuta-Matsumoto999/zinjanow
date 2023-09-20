import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/shrine/get_shrine_repository_impl.dart';

final getShrineRepositoryProvider = Provider<GetShrineRepository>(
  (ref) => GetShrineRepositoryImpl(
    googleShrineDatasource: ref.watch(googleShrineDatasourceProvider), 
    shrineFactory: ref.watch(shrineFactoryProvider)
  )
);

abstract class GetShrineRepository {
  Future<List<Shrine>> getShrines();
}