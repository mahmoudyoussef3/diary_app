import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note_model.dart';
import '../notes_cubit/notes_cubit.dart';
import 'add_note_bottom_sheet.dart';

import 'note_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  NoteModel? noteModel;
  @override
  void initState() {
    BlocProvider.of<NnotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text(
            'My Diary',
            style: TextStyle(fontSize: 32, fontFamily: 'Pacifico'),
          ),
        ),
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: BlocBuilder<NnotesCubit, NnotesState>(
            builder: (context, state) {
              List<NoteModel> notes =
                  BlocProvider.of<NnotesCubit>(context).notes!;
              return notes.length == 0
                  ? const Column(children: [
                      SizedBox(
                        height: 30,
                      ),
                      // CustomAppBar(
                      //   textStyle:
                      //       TextStyle(fontSize: 32, fontFamily: 'Pacifico'),
                      //   title: 'My Diary',
                      //   iconData: Icons.search,
                      // ),
                      SizedBox(
                        height: 270,
                      ),
                      Center(
                        child: Text(
                          "Start your Journey  📝  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      )
                    ])
                  : const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Expanded(child: NotesListView())
                        ],
                      ),
                    );
            },
          ),
        ));
  }
}
