import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../quots/qutos_cubit.dart';

class QuotsList extends StatefulWidget {
  const QuotsList({super.key});

  @override
  State<QuotsList> createState() => _QuotsListState();
}

class _QuotsListState extends State<QuotsList> {


  @override
  Widget build(BuildContext context) {
    TextEditingController quotsController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("quots List"),
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
        create: (context) => QutosCubit()..getquotes(),
        child: BlocBuilder<QutosCubit, QutosState>(
          builder: (context, quotsstate) {
            print('quots${quotsstate.runtimeType}');
            if(quotsstate is QuotsLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(quotsstate is QuotsLoaded){
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
                          quotsController.addListener(() {
                            setState(() {
                              quotsstate.quotes .where((element) =>
                                  element.quote!.contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: quotsController,
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
                          suffixIcon: (quotsController.text.isNotEmpty)?IconButton(onPressed: () {
                            quotsController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),




                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:quotsstate.quotes.length ,
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('  QUOTS ID :',style: TextStyle(fontWeight: FontWeight.bold),),
                                              Text('  ${quotsstate.quotes[index].id}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('  AUTHOR :',style: TextStyle(fontWeight: FontWeight.bold),),
                                              Text('  ${quotsstate.quotes[index].author}',style: TextStyle(color: Colors.green),),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('  QUOTE :',style: TextStyle(fontWeight: FontWeight.bold),),
                                              SizedBox(
                                                  width: 350,
                                                  child: Text('  ${quotsstate.quotes[index].quote}')),
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