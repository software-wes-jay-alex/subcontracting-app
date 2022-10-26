import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../bloc/bloc_exports.dart';
import '../models/task.dart';
import '../screens/edit_task_screen.dart';
import 'popup_menu.dart';

class MaterialTile extends StatelessWidget {
  const MaterialTile({
    Key? key,
    required this.mat,
  }) : super(key: key);

  final MatInstance mat;

  void _removeOrDeleteMaterial(BuildContext context, MatInstance mat) {
    mat.isDeleted!
        ? context.read<MaterialsBloc>().add(DeleteMaterial(mat: mat))
        : context.read<MaterialsBloc>().add(RemoveMaterial(mat: mat));
  }

  void _editMaterial(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: ((context) {
          return SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
              child: EditMatScreen(oldMat: mat),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mat.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mat.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: mat.isDone!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(mat.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: mat.isDone,
                onChanged: mat.isDeleted == false
                    ? (value) {
                        context
                            .read<MaterialsBloc>()
                            .add(UpdateMaterial(mat: mat));
                      }
                    : null,
              ),
              PopupMenu(
                cancelOrDeleteCallback: () => _removeOrDeleteMaterial(context, mat),
                mat: mat,
                likeOrDislikeCallback: () => context
                    .read<MaterialsBloc>()
                    .add(MarkFavoriteOrUnFavoriteMat(mat: mat)),
                editMatCallback: () {
                  Navigator.of(context).pop();
                  _editMaterial(context);
                },
                restoreMatCallback: () =>
                    context.read<MaterialsBloc>().add(RestoreMat(mat: mat)),
              )
            ],
          )
        ],
      ),
    );
  }
}
