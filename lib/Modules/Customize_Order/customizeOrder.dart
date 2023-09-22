import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class CustomizeOrder extends StatelessWidget {
  const CustomizeOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    40.h,
                    const Text(
                      "Customize Order",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    20.h,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/krown-sushi.appspot.com/o/dish_Images%2Fsalmon_sushi.jpg?alt=media&token=55672d35-c838-4e89-ad2a-adbee36e8197',
                        width: 320,
                        height: 145,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    40.h,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Toppings",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    const Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          label: Text('Onions'),
                        ),
                        Chip(
                          label: Text('Mushrooms'),
                        ),
                        Chip(
                          label: Text('Tomatoes'),
                        ),
                        Chip(
                          label: Text('Lettuce'),
                        ),
                        Chip(
                          label: Text('Olives'),
                        ),
                        Chip(
                          label: Text('Jalapenos'),
                        ),
                      ],
                    ),
                    20.h,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sauces",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    const Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          label: Text('Ketchup'),
                        ),
                        Chip(
                          label: Text('Mustard'),
                        ),
                        Chip(
                          label: Text('Mayonnaise'),
                        ),
                        Chip(
                          label: Text('BBQ sauce'),
                        ),
                        Chip(
                          label: Text('Hot sauce'),
                        ),
                        Chip(
                          label: Text('Wasabi'),
                        ),
                        Chip(
                          label: Text('Teriyaki'),
                        ),
                        Chip(
                          label: Text('Sriracha'),
                        ),
                        Chip(
                          label: Text('Pesto'),
                        ),
                      ],
                    ),
                    20.h,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Spice level",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    const Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          label: Text('No spice'),
                        ),
                        Chip(
                          label: Text('Medium'),
                        ),
                        Chip(
                          label: Text('Mild'),
                        ),
                        Chip(
                          label: Text('Hot'),
                        ),
                        Chip(
                          label: Text('Extra hot'),
                        ),
                      ],
                    ),
                    20.h,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Side dishes",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    20.h,
                    const Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          label: Text('French fries'),
                        ),
                        Chip(
                          label: Text('Onion rings'),
                        ),
                        Chip(
                          label: Text('Salad'),
                        ),
                        Chip(
                          label: Text('Soup'),
                        ),
                        Chip(
                          label: Text('Rice'),
                        ),
                      ],
                    ),
                    40.h,
                    SizedBox(
                      height: 48,
                      width: double.maxFinite,
                      child: FilledButton(
                        child: Text('Order'),
                        onPressed: () {},
                      ),
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
