import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Dish_Details/dishDetails.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class dishCard extends StatelessWidget {
  dishCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
  });

  late var name;
  late var price;
  late var image;
  late var desc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DishDetails(
                    desc: desc,
                    name: name,
                    image: image,
                    price: price,
                  )),
        );
      },
      child: Container(
        height: 183.6,
        width: 153,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0x238B8B8B),
                blurRadius: 20,
                offset: Offset(0, 4),
                spreadRadius: 6,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      image,
                      width: 131.53,
                      height: 107.37,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.h,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$ ${price}',
                      style: const TextStyle(
                        color: Color(0xFF106FDF),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: ShapeDecoration(
                        color: HexColor('6750A4'),
                        shape: const OvalBorder(),
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class dishProgressCard extends StatelessWidget {
  dishProgressCard({
    super.key,
    required this.name,
    required this.image,
    required this.status,
    required this.progress,
  });

  final String name;
  final String image;
  final String status;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 243,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x238B8B8B),
              blurRadius: 20,
              offset: Offset(0, 4),
              spreadRadius: 6,
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                width: 300,
                height: 115,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          10.h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Chip(
                  label: Text(status),
                ),
              )
            ],
          ),
          10.h,
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 20,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF4F4F4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE3E3E3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                width: 295,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: progress,
                      height: 12,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF6750A4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          20.h,
        ],
      ),
    );
  }
}

class suggestionDishCard extends StatelessWidget {
  suggestionDishCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
  });
  late var name;
  late var price;
  late var image;
  late var desc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DishDetails(
                  name: name, desc: desc, image: image, price: price)),
        );
      },
      child: Container(
        width: 320,
        height: 151,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0x238B8B8B),
                blurRadius: 20,
                offset: Offset(0, 4),
                spreadRadius: 6,
              )
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 160,
                  height: 131,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\$ $price',
                        style: TextStyle(
                          color: Color(0xFF106FDF),
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: ShapeDecoration(
                                color: HexColor('6750A4'),
                                shape: const OvalBorder(),
                              ),
                            ),
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Home', Icon(Icons.home), Icon(Icons.home)),
  ExampleDestination('Menu', Icon(Icons.menu_book), Icon(Icons.menu_book)),
  ExampleDestination(
      'Reserve a Table', Icon(Icons.table_bar), Icon(Icons.table_bar)),
  ExampleDestination(
      'Track your Orders', Icon(Icons.location_on), Icon(Icons.location_on)),
  ExampleDestination('Order History', Icon(Icons.history), Icon(Icons.history)),
];
