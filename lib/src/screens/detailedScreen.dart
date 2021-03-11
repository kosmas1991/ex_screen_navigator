import 'package:flutter/material.dart';
import '../models/NoteModel.dart';

class DetailedMode extends StatefulWidget {
  final Note currentNote;

  DetailedMode(this.currentNote);

  @override
  _DetailedModeState createState() => _DetailedModeState(currentNote);
}

class _DetailedModeState extends State<DetailedMode> {
  Note currentNote;

  _DetailedModeState(this.currentNote);

  _handleChanges(bool newState) {
    setState(() {
      currentNote.setRead = newState;
    });
    Navigator.pop(context, currentNote.getRead);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () {
          _handleChanges(currentNote.getRead);
        },
        child: Icon(Icons.arrow_back,color: Colors.white,),),
        title: Text(currentNote.getTitle),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              currentNote.getDescription,
              style: TextStyle(fontSize: 20),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Read',style: TextStyle(fontSize: 20),),
                Checkbox(value: currentNote.getRead, onChanged: _handleChanges)
              ],
            )

          ],
        ),
      ),
    );
  }
}
