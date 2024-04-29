import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;

import 'package:camera_app/database/database_class.dart';
import 'package:camera_app/services/imagepicker.dart';
// import 'package:camera_app/state/addimagebloc/add_bloc.dart';
// import 'package:camera_app/state/addimagebloc/add_event.dart';
//import 'package:camera_app/state/addimagebloc/bloc_event.dart';

// import 'package:camera_app/state/addimagebloc/main_bloc.dart';
import 'package:camera_app/state/saveImagebloc/bloc_event.dart';
import 'package:camera_app/state/saveImagebloc/bloc_state.dart';
import 'package:camera_app/state/saveImagebloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DatabaseHelper helper = DatabaseHelper();
  //final ImageMainBloc mainBloc;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              ImageMainBloc(helper)..add(LoadingImageEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Image Viewer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Viewer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseHelper helper;
  late ImageMainBloc mainBloc;
  @override
  void initState() {
    helper = DatabaseHelper();
    mainBloc = ImageMainBloc(helper);
    //mainBloc.add(LoadingImageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          BlocBuilder<ImageMainBloc, ImageState>(
            builder: (context, state) {
              if (state is LoadedImages) {
                final totalImages =
                    state.models.length; // Get total image count
                return Text(
                  'Total Image $totalImages',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                );
              }
              return Text('no image');
            },
          ),
        ],
      ),
      body: BlocBuilder<ImageMainBloc, ImageState>(
        //bloc: mainBloc,
        //  if (state is LoadedImages) {
        //     return ListView.builder(
        //         itemCount: state.models.length,
        //         itemBuilder: (context, i) {
        //           var file = state.models[i].imageName;
        //           var used = Uint8List.fromList(file);

        //           print(state.models.length);
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               child: Image.memory(used),
        //             ),
        //           );
        //         });
        //   }
        // listenWhen: (previous, current) => current is ImageState,
        // ignore: unnecessary_type_check
        //buildWhen: (previous, current) => current is! ImageState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingImageState:
              return const Center(child: CircularProgressIndicator());
            // case PickImageState:
            //   return  ;
            case LoadedImages:
              final model = state as LoadedImages;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: model.models.length,
                      itemBuilder: (context, i) {
                        var file = model.models[i].imageName;
                        var used = Uint8List.fromList(file);

                        print(state.models.length);
                        return GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Hold to delete image')));
                            },
                            onLongPress: () {
                              context.read<ImageMainBloc>().add(
                                  DeleteEvent(id: model.models[i].imageId));
                            },
                            child: GridTile(
                              child: Image.memory(
                                used, // Get the image URL from the list
                                fit: BoxFit
                                    .cover, // Adjust the image size to cover the tile
                              ),
                            )
                            //  Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 100,
                            //     child: Image.memory(
                            //       used,
                            //       height: 10,
                            //     ),
                            //   ),
                            // ),
                            );
                      }),
                ),
              );
          }
          Default:
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        buildWhen: (previousState, currentState) => true,
        // listener: (BuildContext context, ImageState state) {
        //   if (state is LoadedImages) {
        //     setState(() {});
        //   }
        // },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () async {
            //context.read<AddMainBloc>().add(const PickImageEvent());
            context.read<ImageMainBloc>().add(PickingImageEvent());
          }),
    );
  }
}
