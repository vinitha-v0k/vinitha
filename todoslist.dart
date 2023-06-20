import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/todoscubit/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';




class TodosList extends StatefulWidget {
  const TodosList({super.key});

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  TextEditingController todosController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("todos List"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.purple,Colors.pink],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => TodosCubit()..gettodos(),
        child: BlocBuilder<TodosCubit, TodosState>(
          builder: (context, todosstate) {
            print('bbb${todosstate.runtimeType}');
            if(todosstate is TodosLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );

            }
            if(todosstate is TodosLoaded){
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.3,0.3,),
                                blurRadius: 10.2,
                                spreadRadius: 2.0
                            ),
                          ]

                      ),
                      child: TextFormField(
                        onChanged: (value){
                          print('dd$value');
                          todosController.addListener(() {
                            setState(() {
                              todosstate.todos.where((element) =>
                                  element.todo!.toLowerCase().contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: todosController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )
                          ),
                          prefixIcon: Icon(Icons.search_rounded,),
                          suffixIcon: (todosController.text.isNotEmpty)?IconButton(onPressed: () {
                            todosController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),


                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: todosstate.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            // onTap: (){
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserDetails()));
                            // },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Container(
                                // padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                                height: 100,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(color: Colors.purpleAccent
                                    )
                                ),

                                child: Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 20),
                                    //   child: Container(
                                    //     //height: 70,
                                    //     // width: 70,
                                    //     // color: Colors.cyanAccent,
                                    //     child: const Icon(Icons.person_rounded,size: 80,),
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 260),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('  TODOS ID : ',style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text('  ${todosstate.todos[index].id}'),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 220),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('  TODOS USER ID :',style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text('  ${todosstate.todos[index].userId}'),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('  TODOS :',style: TextStyle(fontWeight: FontWeight.bold),),
                                              SizedBox(
                                                  width: 300,
                                                  child: Text('   ${todosstate.todos[index].todo}')),
                                            ],
                                          ),


                                          SizedBox(
                                            height: 8,
                                          ),


                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),


                ],

              );
            }
            return Center(
              child: Text('Record Not Found'),
            );
          },
        ),
      ),
    );
  }
}
