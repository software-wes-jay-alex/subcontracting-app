part of 'tasks_bloc.dart';

class MaterialsState extends Equatable {
  final List<MatInstance> pendingMats;
  final List<MatInstance> completedMats;
  final List<MatInstance> favoriteMats;
  final List<MatInstance> removedMats;

  const MaterialsState({
    this.pendingMats = const <MatInstance>[],
    this.completedMats = const <MatInstance>[],
    this.favoriteMats = const <MatInstance>[],
    this.removedMats = const <MatInstance>[],
  });

  @override
  List<Object> get props => [
        pendingMats,
        completedMats,
        favoriteMats,
        removedMats,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingMats.map((x) => x.toMap()).toList(),
      'completedTasks': pendingMats.map((x) => x.toMap()).toList(),
      'favoriteTasks': pendingMats.map((x) => x.toMap()).toList(),
      'removedTasks': pendingMats.map((x) => x.toMap()).toList(),
    };
  }

  factory MaterialsState.fromMap(Map<String, dynamic> map) {
    return MaterialsState(
      pendingMats: List<MatInstance>.from(
        (map['pendingTasks'])?.map<MatInstance>(
          (x) => MatInstance.fromMap(x),
        ),
      ),
      completedMats: List<MatInstance>.from(
        (map['completedTasks'])?.map<MatInstance>(
          (x) => MatInstance.fromMap(x),
        ),
      ),
      favoriteMats: List<MatInstance>.from(
        (map['favoriteTasks'])?.map<MatInstance>(
          (x) => MatInstance.fromMap(x),
        ),
      ),
      removedMats: List<MatInstance>.from(
        (map['removedTasks'])?.map<MatInstance>(
          (x) => MatInstance.fromMap(x),
        ),
      ),
    );
  }
}
