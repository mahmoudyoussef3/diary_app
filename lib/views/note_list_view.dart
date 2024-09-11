import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note_model.dart';
import '../notes_cubit/notes_cubit.dart';
import 'note_item.dart';


class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NnotesCubit, NnotesState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NnotesCubit>(context).notes!;
      return (Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: NoteItem(
                      note: notes[index],
                    ));
              })));
    });

  }
}
