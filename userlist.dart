import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/list/userdetails.dart';
import 'package:myfirstflutterapp/usercubit/user_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("User List"),
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
        create: (context) => UserCubit()..getusers('',',','','','','','',''),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, usstate) {
            if(usstate is UserLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(usstate is UserLoaded){
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
                          userController.addListener(() {
                            setState(() {
                              usstate.user .where((element) =>
                                  element.email!.contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: userController,
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
                          suffixIcon: (userController.text.isNotEmpty)?IconButton(onPressed: () {
                            userController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),




                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: usstate.user.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetails(id: usstate.user[index].id.toString(),
                                first: usstate.user[index].firstName.toString(),
                                last:usstate.user[index].lastName.toString(),
                                madien: usstate.user[index].maidenName.toString(),
                                phone: usstate.user[index].phone.toString(), email: usstate.user[index].email.toString(), ip: usstate.user[index].ip.toString(),
                                username: usstate.user[index].username.toString(), password: usstate.user[index].password.toString(),

                              )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: Container(
                                // padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                                height: 100,
                                width: 20,
                                decoration:  BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.purpleAccent
                                    )
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                        //height: 70,
                                        // width: 70,
                                        // color: Colors.cyanAccent,
                                        child: const Icon(Icons.person_rounded,size: 80,),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(60, 10, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('ID :'),
                                              Text('${usstate.user[index].id}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text('Email :'),
                                              Text('${usstate.user[index].email}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text('phone:'),
                                              Text('${usstate.user[index].phone}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text('gender:'),
                                              Text('${usstate.user[index].gender}'),
                                            ],
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
