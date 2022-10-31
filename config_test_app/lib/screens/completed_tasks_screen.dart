import 'package:flutter/material.dart';
import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class CompletedMatsScreen extends StatefulWidget {
  const CompletedMatsScreen({Key? key}) : super(key: key);

  static const id = "materials_screen";

  @override
  State<CompletedMatsScreen> createState() => _CompletedMatsScreenState();
}

class _CompletedMatsScreenState extends State<CompletedMatsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (context, state) {
        List<MatInstance> mats = state.completedMats;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${mats.length} Materials',
                ),
              ),
            ),
            MaterialsList(mats: mats)
          ],
        );
      },
    );
  }
}
