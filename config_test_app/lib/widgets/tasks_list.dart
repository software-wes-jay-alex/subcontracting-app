import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class MaterialsList extends StatelessWidget {
  const MaterialsList({
    Key? key,
    required this.mats,
  }) : super(key: key);

  final List<MatInstance> mats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: mats
              .map((mat) => ExpansionPanelRadio(
                  value: mat.id,
                  headerBuilder: (context, isExpanded) =>
                      MaterialTile(mat: mat),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: mat.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: mat.description),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
