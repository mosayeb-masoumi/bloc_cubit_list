part of 'student_list_cubit.dart';

@immutable
abstract class StudentListState {
  const StudentListState();
}

// initialize
class StudentListInitial extends StudentListState {
  const StudentListInitial();
}


// loading
class StudentListLoading extends StudentListState {
  const StudentListLoading();
}

//loaded
class StudentListLoaded extends StudentListState {
  final List<Student> studentList;
  const StudentListLoaded(this.studentList);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentListLoaded &&
          runtimeType == other.runtimeType &&
          studentList == other.studentList;

  @override
  int get hashCode => studentList.hashCode;
}


//error
class StudentListError extends StudentListState {
  final String message;
  const StudentListError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentListError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
