import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/shrine_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

final shrineFactoryProvider = Provider<ShrineFactory>(
  (ref) => ShrineFactoryImpl(
    shrinePhotoFactory: ref.watch(shrinePhotoFactoryprovider),
  )
);

abstract class ShrineFactory {
  Shrine create({
    required String id,
    required String name,
    List<Photo>? photos,
    num? rating
  });

  Shrine createFromModel(ShrineResponseModel shrineResponseModel);
}