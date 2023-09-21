import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';

abstract class GetShrineDetailUsecase {
  Future<Shrine> excute(placeId);
}