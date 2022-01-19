class Note {
  String? noteID;
  String? noteTitle;
  String? noteContent;
 late DateTime createDateTime;
 late DateTime latestEditDateTime;
  Note({
     this.noteID,
     this.noteTitle,
     this.noteContent,
    required this.createDateTime,
    required this.latestEditDateTime,
  });

 factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            noteContent: item['noteContent'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']) : DateTime.now()
           );
  }
}
