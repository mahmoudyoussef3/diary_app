import 'package:diary_app/simpleBlocObserver.dart';
import 'package:diary_app/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';


import 'constants.dart';
import 'create_note/add_note.dart';
import 'models/note_model.dart';
import 'notes_cubit/notes_cubit.dart';

main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kPrimaryNoteBoxName);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => NotesCubit()),
          BlocProvider(create: (context)=>NnotesCubit())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData.dark(),
            theme:
                ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
            home: SplashScreen()
            // const NotesView()
    ));
  }
}
