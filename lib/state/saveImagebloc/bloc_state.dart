import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../database/ui_database.dart';

class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object?> get props => [];
}

class InitialImageState extends ImageState {}

class LoadingImageState extends ImageState {}

class LoadedImages extends ImageState {
  final List<ImageModel> models;
  const LoadedImages(this.models);
    @override
  List<Object?> get props => [models];
}

class PickImageState extends ImageState {
  final XFile? file;
  const PickImageState({required this.file});
    @override
  List<Object?> get props => [file];
  // String get imageBase64String {
  //   Future<String> imageBytes = file!.readAsString();
  //   return base64Encode(utf8.encode(imageBytes.toString()));
  // }
}
