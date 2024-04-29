// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:camera_app/state/addimagebloc/add_event.dart';
// import 'package:camera_app/state/addimagebloc/add_state.dart';

// import '../../services/imagepicker.dart';

// class AddMainBloc extends Bloc<AddEvent, AddState> {
//   AddMainBloc() : super(AddInitialState()) {
//     on<PickImageEvent>(pickImageEvent);
//   }

//    FutureOr<void> pickImageEvent(
//       AddEvent event, Emitter<AddState> emit) async {
//     var picked = await ImagePickerClass.pickImage();
//     emit(SaveImageEvent(file: picked));
//   }
// }
