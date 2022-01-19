import 'package:api_rest_app/models/api_response.dart';
import 'package:api_rest_app/models/note_for_listing.dart';
import 'package:api_rest_app/services/note_services.dart';
import 'package:api_rest_app/views/modify_note.dart';
import 'package:api_rest_app/views/note_delete.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteService get service => GetIt.I<NoteService>();

  //List<NoteforListing> note = [];
  late APIResponse<List<NoteforListing>> _apiResponse;
  bool _isLoading = false;

  String fromDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void initState() {
    //note = service.getNoteList();
    _fecthNotes();
    super.initState();
  }

  _fecthNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNoteList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NoteModify(
                      noteId: null,
                    )));
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Note"),
        ),
        body: Builder(builder: (_) {
          if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (_apiResponse.error) {
            return Center(
              child: Text(_apiResponse.errorMessage),
            );
          }
          return ListView.separated(
              itemBuilder: (_, index) {
                return Dismissible(
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) async {
                      return await showDialog(
                          context: context, builder: (_) => NoteDelete());
                    },
                    key: ValueKey(_apiResponse.data![index].noteID),
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => NoteModify(
                                  noteId: _apiResponse.data![index].noteID,
                                )));
                      },
                      leading: Icon(Icons.person),
                      title: Text(_apiResponse.data![index].noteTitle,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      subtitle: Text(
                          "Modifier le ${fromDateTime(_apiResponse.data![index].latestEditDateTime)}"),
                    ));
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: _apiResponse.data!.length);
        }));
  }
}
