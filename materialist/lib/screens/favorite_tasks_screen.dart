import 'package:flutter/material.dart';
import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class FavoriteMatsScreen extends StatefulWidget {
  const FavoriteMatsScreen({Key? key}) : super(key: key);

  static const id = "fav_mats_screen";

  @override
  State<FavoriteMatsScreen> createState() => _FavoriteMatsScreenState();
}

class _FavoriteMatsScreenState extends State<FavoriteMatsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (context, state) {
        List<MatInstance> mats = state.favoriteMats;
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
