// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class EditMatScreen extends StatelessWidget {
  final MatInstance oldMat;

  const EditMatScreen({
    Key? key,
    required this.oldMat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldMat.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldMat.description);
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Edit Material',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text("Title"), border: OutlineInputBorder()),
            ),
          ),
          TextField(
            controller: descriptionController,
            autofocus: true,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text("Description"), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editedMat = MatInstance(
                        id: oldMat.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateTime.now().toString());
                    context
                        .read<MaterialsBloc>()
                        .add(EditMat(newMat: editedMat, oldMats: oldMat));
                    Navigator.pop(context);
                  },
                  child: const Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
