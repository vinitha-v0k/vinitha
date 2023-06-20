import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/list/postlist.dart';
import 'package:myfirstflutterapp/list/productlist.dart';
import 'package:myfirstflutterapp/list/quotslist.dart';
import 'package:myfirstflutterapp/list/todoslist.dart';
import 'package:myfirstflutterapp/list/userlist.dart';

import 'cartslist.dart';
import 'commentslist.dart';




class Dashboared extends StatefulWidget {
  const Dashboared({super.key});

  @override
  State<Dashboared> createState() => _DashboaredState();
}

class _DashboaredState extends State<Dashboared> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(

        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Details List"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent)

                ),
                child: Row(

                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    // CircleAvatar(
                    //   radius: 30,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: NetworkImage(
                    //           '',
                    //         ),
                    //         fit: BoxFit.fill
                    //       )
                    //     ),
                    //   ),
                    //
                    // ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_pin,size: 70,color: Colors.white,),
                              SizedBox(width: 20,),
                              Text('Welcome back',style: TextStyle(
                                  fontSize: 20,color: Colors.white
                              ),),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                ),

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('Product Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 208),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartsList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('Carts Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 229),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommentsList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('comments Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 182),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('post Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 238),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuotsList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('quots Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 227),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TodosList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('todos Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 227),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UsersList()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 20,right: 10,bottom: 10),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white54,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.purpleAccent),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20,left: 10),
                        child: Column(
                          children: [
                            Text('user Details',style: TextStyle(
                                fontSize: 20,color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 239),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)


                          ),
                          //border: Border.all(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
