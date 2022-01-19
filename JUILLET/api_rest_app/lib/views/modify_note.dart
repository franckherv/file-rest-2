import 'package:api_rest_app/models/note.dart';
import 'package:api_rest_app/services/note_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteModify extends StatefulWidget {
  final String? noteId;
  NoteModify({required this.noteId});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteId != null;

  NoteService get noteService => GetIt.I<NoteService>();

  TextEditingController _tiTleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  String? errorMessage;
  Note? note;
  bool _isLoading = false;

  @override
  void initState() {
    
    if (isEditing) {
         setState(() {
      _isLoading = false;
    });

    setState(() {
      _isLoading = true;
    });
    noteService.getNote(widget.noteId.toString()).then((response) {
      if (response.error) {
        errorMessage = response.errorMessage;
      }
      note = response.data;
      _tiTleController.text = note!.noteTitle.toString();
      _contentController.text = note!.noteContent.toString();
    });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edite note" : "Create note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isLoading? Center( child: CircularProgressIndicator(),): Column(
          children: [
            TextField(
              controller: _tiTleController,
              decoration: InputDecoration(labelText: "note title"),
            ),
            Container(
              height: 8,
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: "note content"),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () { 
                  if (isEditing) {
                    //
                  } else {}
                  Navigator.of(context).pop();
                },
                child: Text("Submit", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
