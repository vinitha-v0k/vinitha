import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myfirstflutterapp/postcubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  TextEditingController postController = TextEditingController();
  bool canicons=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Post List"),
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
        create: (context) => PostCubit()..getpost(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, poststate) {
            if(poststate is PostLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(poststate is PostLoaded){
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
                          postController.addListener(() {
                            setState(() {
                              poststate.posts.where((element) =>
                                  element.body!.toLowerCase().contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: postController,
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
                          suffixIcon: (postController.text.isNotEmpty)?IconButton(onPressed: () {
                            postController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),


                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: poststate.posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Container(
                              // height: 100,
                              // width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.3, 0.3,),
                                        blurRadius: 10.2,
                                        spreadRadius: 2.0
                                    ),
                                  ]

                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [

                                      Text('  POSTID :${poststate.posts[index].id}',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text('  USERID :${poststate.posts[index].userId}',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text('  TAGE:${poststate.posts[index].tags}'),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(
                                            height: 26,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.purple,
                                                borderRadius: BorderRadius.all(Radius.circular(10))

                                            ),

                                            child: Center(child: Text('  REACTIONS:${poststate.posts[index].reactions}',style: TextStyle(color: Colors.white),))),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width:340,
                                          child: Text('  TITLE :${poststate.posts[index].title}')),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('  BODY :'),
                                      SizedBox(
                                          width: 340,
                                          child: Text('  ${poststate.posts[index].body}')),

                                    ],
                                  ),
                                  SizedBox(height: 8,)
                                ],
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
