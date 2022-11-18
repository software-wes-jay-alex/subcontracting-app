import 'dart:async';
import 'package:equatable/equatable.dart';
import '../../models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class MaterialsBloc extends HydratedBloc<MaterialsEvent, MaterialsState> {
  MaterialsBloc() : super(const MaterialsState()) {
    on<AddMaterial>(_onAddMaterial);
    on<UpdateMaterial>(_onUpdateMaterial);
    on<DeleteMaterial>(_onDeleteMaterial);
    on<RemoveMaterial>(_onRemoveMaterial);
    on<MarkFavoriteOrUnFavoriteMat>(_onMarkFavoriteOrUnFavoriteMaterial);
    on<EditMat>(_onEditMaterial);
    on<RestoreMat>(_onRestoreMaterial);
    on<DeleteAllMats>(_onDeleteAllMaterial);
  }

  FutureOr<void> _onAddMaterial(
      AddMaterial event, Emitter<MaterialsState> emit) {
    final state = this.state;
    emit(MaterialsState(
      pendingMats: List.from(state.pendingMats)..add(event.mat),
      completedMats: state.completedMats,
      favoriteMats: state.favoriteMats,
      removedMats: state.removedMats,
    ));
  }

  FutureOr<void> _onUpdateMaterial(
      UpdateMaterial event, Emitter<MaterialsState> emit) {
    final state = this.state;
    final mat = event.mat;
    List<MatInstance> pendingMats = state.pendingMats;
    List<MatInstance> completedMats = state.completedMats;
    List<MatInstance> favoriteMats = state.favoriteMats;

    if (mat.isDone == false) {
      if (mat.isFavorite == false) {
        pendingMats = List.from(pendingMats)..remove(mat);
        completedMats = List.from(completedMats)..add(mat.copyWith(isDone: true));
        //completedMats.insert(0, mat.copyWith(isDone: true));
      } else {
        var matIndex = favoriteMats.indexOf(mat);
        pendingMats = List.from(pendingMats)..remove(mat);
        completedMats = List.from(completedMats)..add(mat.copyWith(isDone: true));
        //completedMats.insert(0, mat.copyWith(isDone: true));
        favoriteMats = List.from(favoriteMats)
          ..remove(mat)
          ..add(mat.copyWith(isDone: true));
          //..insert(matIndex, mat.copyWith(isDone: true));
      }
    } else {
      if (mat.isFavorite == false) {
        completedMats = List.from(completedMats)..remove(mat);
        pendingMats = List.from(pendingMats)..add(mat.copyWith(isDone: false));
        //pendingMats = List.from(pendingMats)
        //  ..insert(0, mat.copyWith(isDone: false));
      } else {
        var matIndex = favoriteMats.indexOf(mat);
        completedMats = List.from(completedMats)..remove(mat);
        pendingMats = List.from(pendingMats)..add(mat.copyWith(isDone: false));
        //pendingMats = List.from(pendingMats)
        //  ..insert(0, mat.copyWith(isDone: false));
        favoriteMats = List.from(favoriteMats)
          ..remove(mat)
          ..add(mat.copyWith(isDone: false));
          //..insert(matIndex, mat.copyWith(isDone: false));
      }
    }
    emit(MaterialsState(
      pendingMats: pendingMats,
      completedMats: completedMats,
      favoriteMats: favoriteMats,
      removedMats: state.removedMats,
    ));
  }

  FutureOr<void> _onDeleteMaterial(
      DeleteMaterial event, Emitter<MaterialsState> emit) {
    final state = this.state;
    emit(MaterialsState(
        pendingMats: state.pendingMats,
        completedMats: state.completedMats,
        favoriteMats: state.favoriteMats,
        removedMats: List.from(state.removedMats)..remove(event.mat)));
  }

  FutureOr<void> _onRemoveMaterial(
      RemoveMaterial event, Emitter<MaterialsState> emit) {
    final state = this.state;
    emit(MaterialsState(
        pendingMats: List.from(state.pendingMats)..remove(event.mat),
        completedMats: List.from(state.completedMats)..remove(event.mat),
        favoriteMats: List.from(state.favoriteMats)..remove(event.mat),
        removedMats: List.from(state.removedMats)
          ..add(event.mat.copyWith(isDeleted: true))));
  }

  @override
  MaterialsState? fromJson(Map<String, dynamic> json) {
    return MaterialsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(MaterialsState state) {
    return state.toMap();
  }

  FutureOr<void> _onMarkFavoriteOrUnFavoriteMaterial(
      MarkFavoriteOrUnFavoriteMat event, Emitter<MaterialsState> emit) {
    final state = this.state;
    List<MatInstance> pendingMats = state.pendingMats;
    List<MatInstance> completedMats = state.completedMats;
    List<MatInstance> favoriteMats = state.favoriteMats;

    if (event.mat.isDone == false) {
      if (event.mat.isFavorite == false) {
        var matIndex = pendingMats.indexOf(event.mat);
        pendingMats = List.from(pendingMats)
          ..remove(event.mat)
          ..add(event.mat.copyWith(isFavorite: true));
          //..insert(matIndex, event.mat.copyWith(isFavorite: true));
        favoriteMats.insert(0, event.mat.copyWith(isFavorite: true));
      } else {
        var matIndex = pendingMats.indexOf(event.mat);
        pendingMats = List.from(pendingMats)
          ..remove(event.mat)
          ..add(event.mat.copyWith(isFavorite: false));
          //..insert(matIndex, event.mat.copyWith(isFavorite: false));
        favoriteMats.remove(event.mat);
      }
    } else {
      if (event.mat.isFavorite == false) {
        var matIndex = completedMats.indexOf(event.mat);
        completedMats = List.from(completedMats)
          ..remove(event.mat)
          ..add(event.mat.copyWith(isFavorite: true));
          //..insert(matIndex, event.mat.copyWith(isFavorite: true));
        favoriteMats.add(event.mat.copyWith(isFavorite: true));
        //favoriteMats.insert(0, event.mat.copyWith(isFavorite: true));
      } else {
        var matIndex = completedMats.indexOf(event.mat);
        completedMats = List.from(completedMats)
          ..remove(event.mat)
          ..add(event.mat.copyWith(isFavorite: false));
          //..insert(matIndex, event.mat.copyWith(isFavorite: false));
        favoriteMats.remove(event.mat);
      }
    }
    emit(MaterialsState(
      pendingMats: pendingMats,
      completedMats: completedMats,
      favoriteMats: favoriteMats,
      removedMats: state.removedMats,
    ));
  }

  FutureOr<void> _onEditMaterial(
      EditMat event, Emitter<MaterialsState> emit) {
    final state = this.state;
    List<MatInstance> favoriteMats = state.favoriteMats;
    if (event.oldMats.isFavorite == true) {
      favoriteMats
        ..remove(event.oldMats)
        ..add(event.newMat);
        //..insert(0, event.newMat);
    }
    emit(
      MaterialsState(
        pendingMats: List.from(state.pendingMats)
          ..remove(event.oldMats)
          ..add(event.newMat),
          //..insert(0, event.newMat),
        completedMats: state.completedMats..remove(event.oldMats),
        favoriteMats: favoriteMats,
        removedMats: state.removedMats,
      ),
    );
  }

  FutureOr<void> _onRestoreMaterial(
      RestoreMat event, Emitter<MaterialsState> emit) {
    final state = this.state;
    emit(
      MaterialsState(
        removedMats: List.from(state.removedMats)..remove(event.mat),
        pendingMats: List.from(state.pendingMats)
          ..add(event.mat.copyWith(isDeleted: false, isDone: false, isFavorite: false)),
          //..insert(
          //    0,
          //    event.mat.copyWith(
          //      isDeleted: false,
          //      isDone: false,
          //      isFavorite: false,
          //    )),
        completedMats: state.completedMats,
        favoriteMats: state.favoriteMats,
      ),
    );
  }

  FutureOr<void> _onDeleteAllMaterial(
      DeleteAllMats event, Emitter<MaterialsState> emit) {
    final state = this.state;
    emit(
      MaterialsState(
        removedMats: List.from(state.removedMats)..clear(),
        pendingMats: state.pendingMats,
        completedMats: state.completedMats,
        favoriteMats: state.favoriteMats,
      ),
    );
  }
}
