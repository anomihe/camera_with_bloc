import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera_app/state/saveImagebloc/bloc_event.dart';
import 'package:camera_app/state/saveImagebloc/bloc_state.dart';

import '../../database/database_class.dart';
import '../../services/imagepicker.dart';

class ImageMainBloc extends Bloc<ImageEvent, ImageState> {
  final DatabaseHelper helper;

  ImageMainBloc(this.helper) : super(InitialImageState()) {
    on<LoadingImageEvent>(loadingImageEvent);
    on<PickingImageEvent>(pickingImageEvent);
    on<SaveImageEvent>(saveImageEvent);
    on<DeleteEvent>(deleteEvent);
  }

  FutureOr<void> deleteEvent(DeleteEvent event, Emitter<ImageState> emit) async{
    helper.deleteImage(event.id);
     var images = await helper.loadImage();
  emit(LoadedImages(images));
   // add(LoadingImageEvent());
  }

  FutureOr<void> loadingImageEvent(
      LoadingImageEvent event, Emitter<ImageState> emit) async {
    //emit(LoadingImageState());
    var images = await helper.loadImage();
    emit(LoadedImages(images));
  }

  FutureOr<void> pickingImageEvent(
      PickingImageEvent event, Emitter<ImageState> emit) async {
    var picked = await ImagePickerClass.pickImage();
    var using = await picked!.readAsBytes();

  helper.createImage(using);
 var images = await helper.loadImage();
 add(LoadingImageEvent());
  emit(LoadedImages(images));
    
  }

  FutureOr saveImageEvent(
      SaveImageEvent event, Emitter<ImageState> emit) async {
    // helper.createImage(state);

    add(LoadingImageEvent());
  }
}
