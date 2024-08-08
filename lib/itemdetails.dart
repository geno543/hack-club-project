import 'package:flutter/material.dart';
import 'homepage.dart';

class ItemDetails extends StatelessWidget {
  final Product product;

  ItemDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold( bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 79, 152, 81),
      iconSize: 40,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '.'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: '.'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '.'),
      ],
    ),
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:ListView(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product.imageAsset,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.fill,

                ),
                SizedBox(height: 16),
                Text(
                  product.completedes,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  product.features,
                  style: TextStyle(fontSize: 16),
                ),SizedBox(height: 60,),
                Container(margin: EdgeInsets.only(left: 150),
                  child: MaterialButton(onPressed: (){},child: Text('Add to Cart'),color: const Color.fromARGB(255, 28, 152, 32),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),),)


              ],
            ),]
        ),
      ),
    );
  }
}