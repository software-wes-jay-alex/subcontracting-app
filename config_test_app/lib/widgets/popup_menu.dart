// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final MatInstance mat;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editMatCallback;
  final VoidCallback restoreMatCallback;

  const PopupMenu({
    Key? key,
    required this.mat,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editMatCallback,
    required this.restoreMatCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: mat.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                      onTap: null,
                      child: TextButton.icon(
                          onPressed: editMatCallback,
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                    onTap: likeOrDislikeCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: mat.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: mat.isFavorite == false
                            ? const Text('Add to Favorites')
                            : const Text('Remove from Favorites')),
                  ),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete')))
                ])
            : (context) => [
                  PopupMenuItem(
                      onTap: restoreMatCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever')),
                  )
                ]);
  }
}
