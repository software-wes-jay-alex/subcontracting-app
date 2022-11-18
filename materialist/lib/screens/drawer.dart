import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:materialist/screens/home/user_page.dart';
import '../bloc/bloc_exports.dart';
import 'recycle_bin.dart';
import 'tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            color: Colors.grey,
            child: Text(
              'Material Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<MaterialsBloc, MaterialsState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.folder_special),
                title: const Text('My Materials'),
                trailing: Text(
                    '${state.pendingMats.length} | ${state.completedMats.length}'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('User List'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(Home.id),
          ),
          const Divider(),
          BlocBuilder<MaterialsBloc, MaterialsState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Bin'),
                trailing: Text('${state.removedMats.length}'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: ((newValue) {
                    if (kDebugMode) {
                      print('Dark Mode: $newValue');
                    }
                    if (newValue) {
                      context.read<SwitchBloc>().add(SwitchOnEvent());
                    } else {
                      context.read<SwitchBloc>().add(SwitchOffEvent());
                    }
                  }));
            },
          )
        ],
      )),
    );
  }
}
