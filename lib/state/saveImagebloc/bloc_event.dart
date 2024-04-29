import 'package:equatable/equatable.dart';

class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object?> get props => [];
}

class LoadingImageEvent extends ImageEvent {}

class PickingImageEvent extends ImageEvent {}

class SaveImageEvent extends ImageEvent {
  final String name;
  const SaveImageEvent(this.name);
}

class DeleteEvent extends ImageEvent {
  final String id;

  const DeleteEvent({required this.id});
}
