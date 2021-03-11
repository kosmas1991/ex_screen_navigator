class NoteModel{

  List<Note> _notes;

  NoteModel.initialize () {
    this._notes = <Note>[];
    this._notes.add(Note('Super Market','go to super market',false));
    this._notes.add(Note('Zoo','go to the zoo',false));
    this._notes.add(Note('Learn Flutter','go learn flutter',false));
    this._notes.add(Note('meet a friend','go to meet a friend',false));
    this._notes.add(Note('Doctor','go to the doctor',false));
  }
  List<Note> get getNotes => _notes;

}

class Note{
  final String _title;
  final String _description;
  bool _read;
  Note(this._title,this._description,this._read);
  String get getTitle => _title;
  String get getDescription => _description;
  bool get getRead => _read;
  set setRead(bool state) => this._read = state;
}
