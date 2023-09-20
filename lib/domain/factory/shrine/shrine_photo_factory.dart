import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/shrine_photo_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_photo_model.dart';

final shrinePhotoFactoryprovider = Provider<ShrinePhotoFactory>(
  (ref) => ShrinePhotoFactoryImpl()
);

abstract class ShrinePhotoFactory {
  Photo create({
    String? url
  });

  List<Photo>? createFromModel(ShrinePhotoModel? shrinePhotoModel);
}