import 'package:flutter/material.dart';
import '../bloc/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = "recycle_bin_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: ((context) => [
                      PopupMenuItem(
                          onTap: () => context
                              .read<MaterialsBloc>()
                              .add(DeleteAllMats()),
                          child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Delete all mats')))
                    ]),
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedMats.length} Materials',
                  ),
                ),
              ),
              MaterialsList(mats: state.removedMats)
            ],
          ),
        );
      },
    );
  }
}
