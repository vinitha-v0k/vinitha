import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/usercubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class UserDetails extends StatefulWidget {
  UserDetails({super.key,required this.id,required this.first
    ,required this.last,required this.madien,required this.phone
    ,required this.email,required this.ip,required this.username,required this.password});
  String id;
  String first;
  String last;
  String madien;
  String phone;
  String email;
  String ip;
  String username;
  String password;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}


class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("UserDetails List"),
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
        create: (context) => UserCubit()..getusers(widget.id,widget.first,widget.madien,widget.phone,widget.email,
            widget.ip,widget.username,widget.password),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, usersstate) {
            if(usersstate is UserLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(usersstate is UserLoaded){

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Icon(Icons.person_pin, size: 140,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,

                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  ID:  ${widget.id}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  FIRST NAME:  ${widget.first}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  LASTNAME:  ${widget.last}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  MAIDENNAME:  ${widget.madien}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ),

                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  EMAIL:  ${widget.email}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  PHONE:  ${widget.phone}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),

                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  IP:  ${widget.ip}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  USERNAME:  ${widget.username}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),
                        Card(
                          child: Container(
                            height: 28,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.cyan.shade100,
                                border: Border.all(color: Colors.green)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('  PASSWORD:  ${widget.password}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ),



                      ],
                    ),

                  ],


                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}