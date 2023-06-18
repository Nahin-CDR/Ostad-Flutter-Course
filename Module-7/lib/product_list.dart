import 'package:flutter/material.dart';
import 'package:module7/cart_list.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}
int totalProducts = 0;
List products = [
  {
    "name":"Body Soap",
    "counter" : 0,
    "price" : 12
  },
  {
    "name":"Shampoo",
    "counter" : 0,
    "price" : 50
  },
  {
    "name":"Candy",
    "counter" : 0,
    "price" : 32
  },
  {
    "name":"Juice",
    "counter" : 0,
    "price" : 56
  },
  {
    "name":"Coke",
    "counter" : 0,
    "price" : 99.98
  },
  {
    "name":"Pepsi",
    "counter" : 0,
    "price" : 58.67
  }
];
class _ProductListState extends State<ProductList> {

  Future<dynamic> showDialogue({required BuildContext context,required String message}){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Congratulations!"),
          content: Text(message),
          actions: [
            OutlinedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("ok")
            )
          ],
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product List"),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: ListTile(
                tileColor: Colors.blueGrey.withOpacity(.2),
                title: Text("${products[index]['name']}"),
                subtitle: Text("\$ ${products[index]['price']}"),
                trailing:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Counter ${products[index]['counter']}"),
                    SizedBox(
                      height: 20,
                      child: OutlinedButton(
                          onPressed: (){
                            if(products[index]['counter'] == 5){
                              showDialogue(
                                  context: context,
                                  message: "You have bought 5 ${products[index]['name']} !"
                              );
                            }
                            else{
                              setState(() {
                                products[index]['counter']++;
                                totalProducts++;
                              });
                            }
                          },
                          child: const Text("Buy Now")
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CartPage(totalProducts: totalProducts)));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
} 
