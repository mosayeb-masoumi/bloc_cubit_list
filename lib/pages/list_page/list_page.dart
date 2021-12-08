import 'package:cubit_list/pages/list_page/cubit/student_list_cubit.dart';
import 'package:cubit_list/pages/list_page/data/list_repository.dart';
import 'package:cubit_list/pages/list_page/data/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}


class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Student List cubit"),
      ),
      body: Container(


        margin: EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) => StudentListCubit(GetStudentListRepository()),

          child: BlocConsumer<StudentListCubit, StudentListState>(
            listener: (context, state) {
              if (state is StudentListError) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            builder: (context, state) {

              if(state is StudentListInitial){
                return InitializeGetList();
              }else if (state is StudentListLoading) {
                return buildLoading(context);
              } else if (state is StudentListLoaded) {
                return buildListwithData(state.studentList);
              } else {
                return InitializeGetList();
              }

            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildInitialUi() {
    return Center(
      child: Text("text"),
    );
  }

  Widget buildListwithData(List<Student> studentList) {
    return Center(
      child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context , index){
            return Container(
              
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20 ,top: 10),
                      child: Text(studentList[index].name ,style: TextStyle(color: Colors.white, fontSize: 15 , ),)),
                  SizedBox(height: 10,),
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(studentList[index].family ,style: TextStyle(color: Colors.white , fontSize: 15),)),
                  SizedBox(height: 10,),
                  Container(
                      padding: EdgeInsets.only(left: 20 , bottom: 10),
                      child: Text(studentList[index].age.toString() ,style: TextStyle(color: Colors.white , fontSize: 15),)),
                ],
              ),
            );
          }),
    );
  }

}





class InitializeGetList extends StatelessWidget {
  const InitializeGetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: submitCityName(context),
    );
  }
  submitCityName(BuildContext context) {
    // get weather for the city
    //   final weatheCubit = context.bloc<WeatherCubit>();
    final studentListCubit = BlocProvider.of<StudentListCubit>(context);
    studentListCubit.getStudentList();
  }
}

