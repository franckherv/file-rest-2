class NoteforListing {
  String noteID;
  String noteTitle;
  late DateTime createDateTime;
  late DateTime latestEditDateTime;

  NoteforListing({
    required this.noteID,
    required this.noteTitle,
    required this.createDateTime,
    required this.latestEditDateTime,
  });

  factory NoteforListing.fromJson(Map<String, dynamic> item) {
    return NoteforListing(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        createDateTime: DateTime.parse(item['createDateTime']),
        latestEditDateTime: item['latestEditDateTime'] != null
            ? DateTime.parse(item['latestEditDateTime'])
            : DateTime.now());
  }
}
