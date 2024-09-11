import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../create_note/add_note.dart';
import '../notes_cubit/notes_cubit.dart';
import 'NoteBottomSheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
            child: BlocConsumer<NotesCubit, NotesState>(
                listener: (context, state) {
          if (state is NotesFailure) {
            print('Failed${state.errMessage}');
          }
          if (state is NotesSuccess) {
            BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is NotesLoading ? true : false,

                child: const NoteBottomSheet(),
          );
        })

            )
        );
  }
}
