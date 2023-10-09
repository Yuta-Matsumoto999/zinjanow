import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_detail_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/shrine/get_shrine_detail_repository_impl.dart';

final getShrineDetailRepositoryProvider = Provider<GetShrineDetailRepository>(
  (ref) => GetShrineDetailRepositoryImpl(
    googleShrineDatasource: ref.watch(googleShrineDatasourceProvider), 
    shrineDetailFactory: ref.watch(shrineDetailFactoryProvider)
  )
);

abstract class GetShrineDetailRepository {
  Future<ShrineDetail> getShrineDetail(placeId);
}