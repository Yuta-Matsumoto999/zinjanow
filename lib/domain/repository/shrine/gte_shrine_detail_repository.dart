import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';

abstract class GetShrineDetailRepository {
  Future<Shrine> getShrineDetail(placeId);
}