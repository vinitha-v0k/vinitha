import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../cartscubit/carts_cubit.dart';
import 'dashboard.dart';
class CartsList extends StatefulWidget {
  const CartsList({super.key});

  @override
  State<CartsList> createState() => _CartsListState();
}

class _CartsListState extends State<CartsList> {
  TextEditingController cartsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Carts List"),
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
        create: (context) => CartsCubit()..getcarts(),
        child: BlocBuilder<CartsCubit, CartsState>(
          builder: (context, cartsstate) {
            print('${cartsstate.runtimeType}');
            if(cartsstate is CartsLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(cartsstate is CartsLoaded){
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
                          cartsController.addListener(() {
                            setState(() {
                              cartsstate.cart .where((element) =>
                                  element.products!.contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: cartsController,
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
                          suffixIcon: (cartsController.text.isNotEmpty)?IconButton(onPressed: () {
                            cartsController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),




                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cartsstate.cart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboared()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: Container(
                                // height: 100,
                                // width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.purple.shade50,
                                    border: Border.all(color: Colors.purpleAccent)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text('   ID :${cartsstate.cart[index].products![0].id}'),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Text('  quantity :${cartsstate.cart[index].products![0].quantity}'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('  discountpercentage:${cartsstate.cart[index].products![0].discountPercentage}'),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Text('  discountedPrice:${cartsstate.cart[index].products![0].discountPercentage}'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('  Title :${cartsstate.cart[index].products![0].title}'),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 26,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.pinkAccent.shade100,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Center(child: Text('Price:${cartsstate.cart[index].products![0].price}')),

                                        ),
                                        //SizedBox(),
                                        Container(
                                          height: 26,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.pinkAccent.shade100,
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Center(child: Text('Total:${cartsstate.cart[index].products![0].total}')),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 8,)
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

