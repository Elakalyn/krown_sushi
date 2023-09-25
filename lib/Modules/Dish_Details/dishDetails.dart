import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Customize_Order/customizeOrder.dart';
import 'package:krown_sushi/Modules/Order_Finalization/orderFinalization.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class DishDetails extends StatelessWidget {
  DishDetails({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
  });

  final name;
  final image;
  final desc;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: NavigationDrawer(
        // onDestinationSelected: handleScreenChanged,
        // selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Krown Sushi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          36.h,
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Main Screens',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          18.h,
          ...destinations.map(
            (ExampleDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: HexColor('6750A4'),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    40.h,
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    20.h,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        image,
                        width: 320,
                        height: 145,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    20.h,
                    Row(
                      children: [
                        Text(
                          '4.7',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: ShapeDecoration(
                            color: Color.fromARGB(255, 221, 255, 0),
                            shape: StarBorder(
                              points: 5,
                              innerRadiusRatio: 0.38,
                              pointRounding: 0,
                              valleyRounding: 0,
                              rotation: 0,
                              squash: 0,
                            ),
                          ),
                        ),
                        Spacer(),
                        Stack(
                          children: [
                            Container(
                              width: 224,
                              height: 10,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE6E6E6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 10,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFF9FFF8F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    20.h,
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PickDeliveryOption()),
                          );
                        },
                        child: Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    40.h,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    20.h,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 125,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomizeOrder()),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Customize',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    30.h,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You might like",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    if (name == 'Salmon')
                      Row(
                        children: [
                          dishCard(
                              price: '7.00',
                              name: 'Shrimp',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fshrimp.jpg?alt=media&token=99874d14-f32b-4ec9-817a-0fe3f01a2321'),
                          14.w,
                          dishCard(
                              name: 'Maki',
                              price: '5.00',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fmaki.webp?alt=media&token=47a96fb7-cd4a-422a-9594-a3e865eb6948'),
                        ],
                      ),
                    if (name == 'Ocean Delight')
                      Row(
                        children: [
                          dishCard(
                              price: '7.00',
                              name: 'Shrimp',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fshrimp.jpg?alt=media&token=99874d14-f32b-4ec9-817a-0fe3f01a2321'),
                          14.w,
                          dishCard(
                              name: 'Maki',
                              price: '5.00',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fmaki.webp?alt=media&token=47a96fb7-cd4a-422a-9594-a3e865eb6948'),
                        ],
                      ),
                    if (name == 'California Roll')
                      Row(
                        children: [
                          dishCard(
                              price: '7.00',
                              name: 'Shrimp',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fshrimp.jpg?alt=media&token=99874d14-f32b-4ec9-817a-0fe3f01a2321'),
                          14.w,
                          dishCard(
                              name: 'Maki',
                              price: '5.00',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fmaki.webp?alt=media&token=47a96fb7-cd4a-422a-9594-a3e865eb6948'),
                        ],
                      ),
                    if (name == 'Shrimp')
                      Row(
                        children: [
                          dishCard(
                              price: '5.00',
                              name: 'California Roll',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fcalifornia_roll.jpg?alt=media&token=9b7e6d8c-eee8-42f5-9a14-b2d08f25a519'),
                          14.w,
                          dishCard(
                              name: 'Maki',
                              price: '5.00',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fmaki.webp?alt=media&token=47a96fb7-cd4a-422a-9594-a3e865eb6948'),
                        ],
                      ),
                    if (name == 'Maki')
                      Row(
                        children: [
                          dishCard(
                              price: '5.00',
                              name: 'California Roll',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fcalifornia_roll.jpg?alt=media&token=9b7e6d8c-eee8-42f5-9a14-b2d08f25a519'),
                          14.w,
                          dishCard(
                              name: 'Salmon',
                              price: '12.00',
                              desc: '',
                              image:
                                  'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fsalmon_sushi.jpg?alt=media&token=55672d35-c838-4e89-ad2a-adbee36e8197'),
                        ],
                      ),
                    40.h,
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
