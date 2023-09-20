import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_photo_model.dart';

class ShrinePhotoFactoryImpl implements ShrinePhotoFactory {
  @override
  Photo create({String? url}) {
    return Photo(
      url: url
    );
  }

  @override
  List<Photo>? createFromModel(ShrinePhotoModel? shrinePhotoModel) {
    return shrinePhotoModel?.photos?.map((e) => 
      Photo(
        url: e.url
      )
    ).toList();
  }
}