import 'package:bloc/bloc.dart';
import 'package:cubit_list/pages/list_page/data/list_repository.dart';
import 'package:cubit_list/pages/list_page/data/model/student.dart';
import 'package:meta/meta.dart';

part 'student_list_state.dart';

class StudentListCubit extends Cubit<StudentListState> {

  final ListRepository _listRepository;

  StudentListCubit(this._listRepository) : super(StudentListInitial());

  Future<void> getStudentList() async{
    try{
      emit(StudentListLoading());
      final studentList = await _listRepository.fetchStudent();
      emit(StudentListLoaded(studentList));
    } on Exception {
      emit(StudentListError("couldent fetch studentList . Is the device online?"));
    }
  }

}
