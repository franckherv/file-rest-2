import 'dart:convert';

import 'package:api_rest_app/models/api_response.dart';
import 'package:api_rest_app/models/note.dart';
import 'package:api_rest_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NoteService {
  var  API = Uri.parse("https://tq-notes-api-jkrgrdggbq-el.a.run.app/apiKey");
  static const headers = {
    'apiKey' : '9c610294-272b-4a1e-920a-f4f63b3c6496',
  } ;
  Future<APIResponse<List<NoteforListing>>> getNoteList() {
    //http.get(API + '/notes', headers: headers).then((data)
    return http.get(API , headers: headers).then((data){
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteforListing>[];

        for (var item in jsonData) {
           notes.add(NoteforListing.fromJson(item)
);
        }
        return APIResponse<List<NoteforListing>>(data: notes);
      }
        return APIResponse<List<NoteforListing>>(error: true, errorMessage: "Une erreur s'est produite");

    }).catchError((_) => APIResponse<List<NoteforListing>>(error: true, errorMessage: "Une erreur s'est produite"));

    //   return [
    //   NoteforListing(
    //     noteID: "1",
    //     noteTitle: "Note 1",
    //     createDateTime: DateTime.now(),
    //     latestEditDateTime: DateTime.now(),
    //   ),
    //   NoteforListing(
    //     noteID: "2",
    //     noteTitle: "Note 2",
    //     createDateTime: DateTime.now(),
    //     latestEditDateTime: DateTime.now(),
    //   ),
    //   NoteforListing(
    //     noteID: "3",
    //     noteTitle: "Note 3",
    //     createDateTime: DateTime.now(),
    //     latestEditDateTime: DateTime.now(),
    //   ),
    //   NoteforListing(
    //     noteID: "4",
    //     noteTitle: "Note 4",
    //     createDateTime: DateTime.now(),
    //     latestEditDateTime: DateTime.now(),
    //   ),
    //   NoteforListing(
    //     noteID: "5",
    //     noteTitle: "Note 5",
    //     createDateTime: DateTime.now(),
    //     latestEditDateTime: DateTime.now(),
    //   ),
    // ];
  }

  Future<APIResponse<Note>> getNote( String noteID) {
    //  http.get(API + '/notes/' + noteID, headers: headers).then((response)
    return http.get(API, headers: headers).then((response){
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

      
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
        return APIResponse<Note>(error: true, errorMessage: "Une erreur s'est produite");

    }).catchError((_) => APIResponse<Note>(error: true, errorMessage: "Une erreur s'est produite"));

   
  }
}
