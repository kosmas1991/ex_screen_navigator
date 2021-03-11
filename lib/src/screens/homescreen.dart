import 'package:ex_screen_navigator/src/models/NoteModel.dart';
import 'package:ex_screen_navigator/src/screens/detailedScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes;

  _HomeScreenState() {
    _notes = NoteModel.initialize().getNotes;
  }

  onPressedSentData(int index) async{
    bool data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedMode(_notes[index]),
      ),
    );
    setState(() {
      _notes[index].setRead = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('Screen Navigator')),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              // decoration: BoxDecoration(
              //   border: Border(
              //       top: BorderSide(color: Colors.grey),
              //       bottom: BorderSide(color: Colors.grey)),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. ${_notes[index].getTitle}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon((_notes[index].getRead)? Icons.check_circle : Icons.remove_circle,color: (_notes[index].getRead)? Colors.green : Colors.red)
                ],
              )
            ),
            onTap: () {
              onPressedSentData(index);
            },
          );
        },
        itemCount: _notes.length,
      ),
    );
  }
}
