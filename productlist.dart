import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myfirstflutterapp/productcubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}


class _ProductListState extends State<ProductList> {
  TextEditingController productController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Product List"),
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
        create: (context) => ProductCubit()..getproducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, prodstate) {
            if(prodstate is ProductLoading){
              return  Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                ),
              );
            }
            if(prodstate is ProductLoaded){
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
                          productController.addListener(() {
                            setState(() {
                              prodstate.product.where((element) =>
                                  element.description!.toLowerCase().contains(value.toLowerCase())).toList();
                            });
                          });

                        },
                        controller: productController,
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
                          suffixIcon: (productController.text.isNotEmpty)?IconButton(onPressed: () {
                            productController.text=''; },
                              icon: Icon(Icons.cancel_outlined,color: Colors.cyan,)):Icon(Icons.add,color:Colors.white,),





                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: prodstate.product.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
                            child: Container(
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

                                      Text('  PRODUCTSID :${prodstate.product[index].id}',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text('  BRAND :${prodstate.product[index].brand}',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('  PRICE:${prodstate.product[index].price}'),
                                      Text('  RATING:${prodstate.product[index].rating}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //    width:10,
                                          child: Text('  TITLE :${prodstate.product[index].title}')),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),

                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('  DESCEIPTION :'),
                                      SizedBox(
                                          width: 200,
                                          child: Text('  ${prodstate.product[index].description} ')),

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