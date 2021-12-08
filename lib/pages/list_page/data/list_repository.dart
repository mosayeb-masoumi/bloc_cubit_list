import 'package:cubit_list/pages/list_page/data/model/student.dart';

abstract class ListRepository {
  Future<List<Student>> fetchStudent();
}

class GetStudentListRepository extends ListRepository {

  @override
  Future<List<Student>> fetchStudent() {

    List<Student> _studentList = <Student>[];
    _studentList.add(Student("ali", "rezai", 20));
    _studentList.add(Student("hassan", "moradi", 22));
    _studentList.add(Student("milad", "nabavi", 25));

    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return _studentList == null ? [] : _studentList;
        // return _studentList;
      },
    );
  }





}
