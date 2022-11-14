import 'package:flutter/material.dart';
import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class PendingMatsScreen extends StatefulWidget {
  const PendingMatsScreen({Key? key}) : super(key: key);

  static const id = "pending_mats_screen";

  @override
  State<PendingMatsScreen> createState() => _PendingMatsScreenState();
}

class _PendingMatsScreenState extends State<PendingMatsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (context, state) {
        List<MatInstance> mats = state.pendingMats;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${mats.length} Pending | ${state.completedMats.length} Completed',
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
