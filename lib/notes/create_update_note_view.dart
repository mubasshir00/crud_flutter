import 'package:flutter/material.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({ Key? key }) : super(key: key);

  @override
  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  late final TextEditingController _title;
  late final TextEditingController _body;

  void initState(){
    _title = TextEditingController();
    _body = TextEditingController();
  }

  void dispose(){
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Note'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _title,
            autocorrect: false,
            enableSuggestions: true,
            decoration: const InputDecoration(
              hintText: 'Add Title'
            ),
          ),
          SizedBox(height: 40,),
          TextField(
            controller: _body,
            enableSuggestions: true,
            decoration: const InputDecoration(
              hintText: 'Add Body'
              
            ),
          ),
          TextButton(
            onPressed: () {}, 
            child: Text('Save')
          )
        ],
      ),
    );
  }
}