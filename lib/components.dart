import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class dishProgressCard extends StatelessWidget {
  const dishProgressCard({
    super.key,
  });

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
                'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fsalmon_sushi.jpg?alt=media&token=55672d35-c838-4e89-ad2a-adbee36e8197',
                width: 300,
                height: 115,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          10.h,
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Food Name',
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
                  label: Text('Packaging'),
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
                      width: 210,
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
  const suggestionDishCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 135,
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
                'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fsalmon_sushi.jpg?alt=media&token=55672d35-c838-4e89-ad2a-adbee36e8197',
                width: 160,
                height: 115,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Food Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$ 2.00',
                      style: TextStyle(
                        color: Color(0xFF106FDF),
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Spacer(),
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
                              shape: OvalBorder(),
                            ),
                          ),
                          Icon(
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
      'Reserve a Tabble', Icon(Icons.table_bar), Icon(Icons.table_bar)),
  ExampleDestination(
      'Track your Orders', Icon(Icons.location_on), Icon(Icons.location_on)),
  ExampleDestination('Order History', Icon(Icons.history), Icon(Icons.history)),
];


class table extends StatelessWidget {
  const table({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 109,
      child: Column(
        children: [
          Image.network('https://media.discordapp.net/attachments/673875945198714920/1154418629610328074/occupiedDoublesTable.png')
          ,Text('A6', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ))
    
        ],
      ),
    );
  }
}
