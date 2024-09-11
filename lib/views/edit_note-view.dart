import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'edit_view_body.dart';


class EditNote extends StatelessWidget {
  const EditNote({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: EditViewBody(note: note,),
    );
  }
}
