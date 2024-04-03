import 'package:flutter/material.dart';
import 'package:project123/RouteConstants.dart';
import 'order.dart';
import 'RouteConstants.dart';

class Fruit {
  final String name;
  final String imageUrl;

  Fruit({required this.name, required this.imageUrl});
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Fruit> fruits = [
    Fruit(
      name: 'Rambutan',
      imageUrl:
        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlNl9yYW1idXRhbl9pc29sYXRlZF9vbl93aGl0ZV9iYWNrZ3JvdW5kX2UzMGJjMTA4LWI4YTAtNGY0Zi1iZGIzLTlhOTViZDE2MjE4Ni5wbmc.png'
    ),
     Fruit(
      name: 'Mangosteen',
      imageUrl:
      'https://exoticfruits.co.uk/cdn/shop/products/mangosteen-exoticfruitscouk-131939.jpg?v=1645488483'
    ),

    Fruit(
      name: 'Araza',
      imageUrl:
      'https://5.imimg.com/data5/TI/RL/IG/SELLER-9199709/horse-garm-dal-1000x1000.jpeg',
    ),
    Fruit(
      name: 'Durian',
      imageUrl:
      'https://product.hstatic.net/200000551437/product/monthong_durian___33bdd9b20fa54728ab08711e11521063.png'
    ),
    Fruit(
      name: 'buddhas-hand',
      imageUrl:
      'https://www.healthyfoodtribe.com/wp-content/uploads/2023/05/buddhas-hand-open-fingered.jpg'
    ),
    Fruit(
      name: 'Feijoa',
      imageUrl:
      'https://www.healthyfoodtribe.com/wp-content/uploads/2020/02/feijoa.jpg'
    ),
    Fruit(
      name: 'Capuacu',
      imageUrl:
      'https://www.healthyfoodtribe.com/wp-content/uploads/2022/12/cupuacu.jpg'
    ),
    Fruit(
      name: 'Cherimoya',
      imageUrl:
      'https://www.farmersalmanac.com/wp-content/uploads/2020/11/Grow-Sugar-Apple-Indoors-i512286898.jpg',
    ),
    Fruit(
      name: 'Ackee',
      imageUrl:
      'https://www.healthyfoodtribe.com/wp-content/uploads/2020/04/ackee.jpg'
    ),
    Fruit(
      name: 'Sweetsop',
      imageUrl:
      'https://www.healthyfoodtribe.com/wp-content/uploads/2020/02/soursop.jpg'
    ),
    Fruit(
      name: 'Snake Fruit',
      imageUrl:
      ''
    ),
    Fruit(
      name: 'Jabuticaba',
      imageUrl:
      ''
    ),
    Fruit(
      name: 'Black Sapote',
      imageUrl:
      ''
    ),
  Fruit(
  name: 'Miracle',
  imageUrl:
  ''
  ),
    Fruit(
        name: 'Kiwano',
        imageUrl:
        ''
    ),

    Fruit(
      name: 'Jabuticaba',
      imageUrl:
      ''
    ),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 4, // Spacing between columns
          mainAxisSpacing: 4, // Spacing between rows
          childAspectRatio: 0.7, // Aspect ratio of each grid item
        ),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          Fruit fruit = fruits[index];
          return GestureDetector(
            onTap: () {
                  ()=> Navigator.of(context).pushReplacementNamed(RouteConstants.orderRoute); // Call the makeOrder function
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    fruit.imageUrl,
                    height: 150,
                  ),
                  SizedBox(height: 5),
                  Text(
                    fruit.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
