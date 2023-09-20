import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_model.dart';

final googleShrineDatasourceProvider = Provider<GoogleShrineDatasource>(
  (ref) => GoogleShrineDatasourceImpl()
);

abstract class GoogleShrineDatasource {
  Future<ShrineModel> getShrines();
}