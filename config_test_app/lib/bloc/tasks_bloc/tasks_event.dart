// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class MaterialsEvent extends Equatable {
  const MaterialsEvent();

  @override
  List<Object> get props => [];
}

class AddMaterial extends MaterialsEvent {
  final MatInstance mat;

  const AddMaterial({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class UpdateMaterial extends MaterialsEvent {
  final MatInstance mat;

  const UpdateMaterial({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class RemoveMaterial extends MaterialsEvent {
  final MatInstance mat;

  const RemoveMaterial({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class DeleteMaterial extends MaterialsEvent {
  final MatInstance mat;

  const DeleteMaterial({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class MarkFavoriteOrUnFavoriteMat extends MaterialsEvent {
  final MatInstance mat;

  const MarkFavoriteOrUnFavoriteMat({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class EditMat extends MaterialsEvent {
  final MatInstance oldMats;
  final MatInstance newMat;

  const EditMat({
    required this.oldMats,
    required this.newMat,
  });

  @override
  List<Object> get props => [
        oldMats,
        newMat,
      ];
}

class RestoreMat extends MaterialsEvent {
  final MatInstance mat;
  const RestoreMat({
    required this.mat,
  });

  @override
  List<Object> get props => [mat];
}

class DeleteAllMats extends MaterialsEvent {}
