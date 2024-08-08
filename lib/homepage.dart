import 'package:flutter/material.dart';
import 'itemdetails.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageAsset;
  final String completedes;
  final String features;
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.completedes,
    required this.features,
  });
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  List<Product> products = [
    Product(
        name: "LG headphone",
        description: "description..",
        price: 350.0,
        imageAsset: 'lib/images/download (1).jpeg',
        completedes:'Bluetooth 4.1 Headphones Headset With Linein Function, For IPhone, Galaxy, Huawei, Xiaomi, LG, HTC And Other Smart Phones'
        ,features: 'SKU: GE810EA1LC1A9NAFAMZ \n Product Line: Nigeria \n Model: JAVANLINCJ2132319 \n Production Country: China \n Size (L x W x H cm): 1 x 1 x 1 \n Color: Multicolor \n Main Material: Patent Leather'
    ),
    Product(
        name: "Iphone 11",
        description: "description..",
        price: 550.0,
        imageAsset: 'lib/images/download.jpeg',
        completedes:'The iPhone 11 has a 6.1-inch (15 cm) IPS LCD with a resolution of 1792  828 pixels (1.4 megapixels) at a pixel density of 326 PPI with a maximum brightness of 625 nits and a 1400:1 contrast ratio '
        ,features: ' Front Camera1st Lens: 12 MP, f/2.22nd Lens: TOF 3D cameraCamera Features: HDR Video: Yes, 2160p24/30/60fps, 1080p30/60/120fps, gyro-EIS ProcessorChipset: Apple A13 Bionic (7 nm+)\nCPU: Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)\nGPU: Apple GPU (4-core graphics)MemorySystem Memory: 4 GB RAMInternal Memory: 128 GB StorageCard Slot: NoOperating System  iOS 13'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 79, 152, 81),
        iconSize: 40,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '.'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: '.'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '.'),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.search),
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 13,
                      ),
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.grey[400],
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.menu,
                    size: 40,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.laptop_chromebook_sharp,
                          size: 35,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Text('Laptop')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.phone_iphone,
                          size: 35,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Text('Phone')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.headphones,
                          size: 35,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Text('Headphone')
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemDetails(product: product),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey,
                          child: Image.asset(
                            product.imageAsset,
                            height: 190,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product.description,
                            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 11, 238, 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}