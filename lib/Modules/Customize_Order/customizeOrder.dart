// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Modules/Order_Finalization/orderFinalization.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

var selected1 = false;
var selected2 = false;
var selected3 = false;
var selected4 = false;
var selected5 = false;
var selected6 = false;
var selected7 = false;
var selected8 = false;
var selected9 = false;
var selected10 = false;
var selected11 = false;
var selected12 = false;
var selected13 = false;
var selected14 = false;
var selected15 = false;
var selected16 = false;
var selected17 = false;
var selected18 = false;
var selected19 = false;
var selected20 = false;
var selected21 = false;
var selected22 = false;
var selected23 = false;
var selected24 = false;
var selected25 = false;
List<String> customizations = [];

class CustomizeOrder extends StatelessWidget {
  CustomizeOrder({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
  });

  final name;
  final image;
  final desc;
  final price;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: HexColor('6750A4'),
                            child: const Icon(Icons.arrow_back,
                                color: Colors.white),
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
                            image,
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
                        Wrap(
                          spacing: 10,
                          children: [
                            ActionChip(
                              backgroundColor:
                                  selected1 ? Colors.grey[300] : Colors.white,
                              label: Text('Onions'),
                              onPressed: () {
                                if (selected1 == false) {
                                  selected1 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected1 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              label: Text('Mushrooms'),
                              backgroundColor:
                                  selected2 ? Colors.grey[300] : Colors.white,
                              onPressed: () {
                                if (selected2 == false) {
                                  selected2 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected2 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected3 ? Colors.grey[300] : Colors.white,
                              label: Text('Tomatoes'),
                              onPressed: () {
                                if (selected3 == false) {
                                  selected3 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected3 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected4 ? Colors.grey[300] : Colors.white,
                              label: Text('Lettuce'),
                              onPressed: () {
                                if (selected4 == false) {
                                  selected4 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected4 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected5 ? Colors.grey[300] : Colors.white,
                              label: Text('Olives'),
                              onPressed: () {
                                if (selected5 == false) {
                                  selected5 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected5 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected6 ? Colors.grey[300] : Colors.white,
                              label: Text('Jalapenos'),
                              onPressed: () {
                                if (selected6 == false) {
                                  selected6 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected6 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
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
                        Wrap(
                          spacing: 10,
                          children: [
                            ActionChip(
                              backgroundColor:
                                  selected7 ? Colors.grey[300] : Colors.white,
                              label: Text('Ketchup'),
                              onPressed: () {
                                if (selected7 == false) {
                                  selected7 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected7 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected8 ? Colors.grey[300] : Colors.white,
                              label: Text('Mustard'),
                              onPressed: () {
                                if (selected8 == false) {
                                  selected8 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected8 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected9 ? Colors.grey[300] : Colors.white,
                              label: Text('Mayonnaise'),
                              onPressed: () {
                                if (selected9 == false) {
                                  selected9 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected9 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected10 ? Colors.grey[300] : Colors.white,
                              label: Text('BBQ sauce'),
                              onPressed: () {
                                if (selected10 == false) {
                                  selected10 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected10 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected11 ? Colors.grey[300] : Colors.white,
                              label: Text('Hot sauce'),
                              onPressed: () {
                                if (selected11 == false) {
                                  selected11 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected11 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected12 ? Colors.grey[300] : Colors.white,
                              label: Text('Wasabi'),
                              onPressed: () {
                                if (selected12 == false) {
                                  selected12 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected12 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected13 ? Colors.grey[300] : Colors.white,
                              label: Text('Teriyaki'),
                              onPressed: () {
                                if (selected13 == false) {
                                  selected13 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected13 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected14 ? Colors.grey[300] : Colors.white,
                              label: Text('Sriracha'),
                              onPressed: () {
                                if (selected14 == false) {
                                  selected14 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected14 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected15 ? Colors.grey[300] : Colors.white,
                              label: Text('Pesto'),
                              onPressed: () {
                                if (selected15 == false) {
                                  selected15 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected15 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
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
                        Wrap(
                          spacing: 10,
                          children: [
                            ActionChip(
                              backgroundColor:
                                  selected16 ? Colors.grey[300] : Colors.white,
                              label: Text('No spice'),
                              onPressed: () {
                                if (selected16 == false) {
                                  selected16 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected16 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected17 ? Colors.grey[300] : Colors.white,
                              label: Text('Medium spice'),
                              onPressed: () {
                                if (selected17 == false) {
                                  selected17 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected17 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected18 ? Colors.grey[300] : Colors.white,
                              label: Text('Mild spice'),
                              onPressed: () {
                                if (selected18 == false) {
                                  selected18 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected18 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected19 ? Colors.grey[300] : Colors.white,
                              label: Text('Hot spice'),
                              onPressed: () {
                                if (selected19 == false) {
                                  selected19 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected19 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected20 ? Colors.grey[300] : Colors.white,
                              label: Text('Extra hot'),
                              onPressed: () {
                                if (selected20 == false) {
                                  selected20 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected20 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
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
                        Wrap(
                          spacing: 10,
                          children: [
                            ActionChip(
                              backgroundColor:
                                  selected21 ? Colors.grey[300] : Colors.white,
                              label: Text('French fries'),
                              onPressed: () {
                                if (selected21 == false) {
                                  selected21 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected21 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected22 ? Colors.grey[300] : Colors.white,
                              label: Text('Onion rings'),
                              onPressed: () {
                                if (selected22 == false) {
                                  selected22 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected22 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected23 ? Colors.grey[300] : Colors.white,
                              label: Text('Salad'),
                              onPressed: () {
                                if (selected23 == false) {
                                  selected23 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected23 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected24 ? Colors.grey[300] : Colors.white,
                              label: Text('Soup'),
                              onPressed: () {
                                if (selected24 == false) {
                                  selected24 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected24 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                            ActionChip(
                              backgroundColor:
                                  selected25 ? Colors.grey[300] : Colors.white,
                              label: Text('Rice'),
                              onPressed: () {
                                if (selected25 == false) {
                                  selected25 = true;
                                  AppCubit.get(context).emit(ApplyFilter());
                                } else {
                                  selected25 = false;
                                  AppCubit.get(context).emit(ApplyFilter());
                                }
                              },
                            ),
                          ],
                        ),
                        40.h,
                        SizedBox(
                          height: 48,
                          width: double.maxFinite,
                          child: FilledButton(
                            child: const Text('Pick delivery method'),
                            onPressed: () {
                              if (selected1 == true) {
                                customizations.add('Onions');
                              }
                              if (selected2 == true) {
                                customizations.add('Mushrooms');
                              }
                              if (selected3 == true) {
                                customizations.add('Tomatoes');
                              }
                              if (selected4 == true) {
                                customizations.add('Lettuce');
                              }
                              if (selected5 == true) {
                                customizations.add('Olives');
                              }
                              if (selected6 == true) {
                                customizations.add('Jalapeno');
                              }
                              if (selected7 == true) {
                                customizations.add('Ketchup');
                              }
                              if (selected8 == true) {
                                customizations.add('Mustard');
                              }
                              if (selected9 == true) {
                                customizations.add('Mayonnaise');
                              }
                              if (selected10 == true) {
                                customizations.add('BBQ Sauce');
                              }
                              if (selected11 == true) {
                                customizations.add('Hot Sauce');
                              }
                              if (selected12 == true) {
                                customizations.add('Wasabi');
                              }
                              if (selected13 == true) {
                                customizations.add('Teriyaki');
                              }
                              if (selected14 == true) {
                                customizations.add('Sriracha');
                              }
                              if (selected15 == true) {
                                customizations.add('Pesto');
                              }
                              if (selected16 == true) {
                                customizations.add('No spice');
                              }
                              if (selected17 == true) {
                                customizations.add('Medium Spice');
                              }
                              if (selected18 == true) {
                                customizations.add('Mild spice');
                              }
                              if (selected19 == true) {
                                customizations.add('Hot spice');
                              }
                              if (selected20 == true) {
                                customizations.add('Extra hot');
                              }
                              if (selected21 == true) {
                                customizations.add('French fries');
                              }
                              if (selected22 == true) {
                                customizations.add('Onion rings');
                              }
                              if (selected23 == true) {
                                customizations.add('Salad');
                              }
                              if (selected24 == true) {
                                customizations.add('Soup');
                              }
                              if (selected25 == true) {
                                customizations.add('Rice');
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PickDeliveryOption(
                                          desc: desc,
                                          image: image,
                                          name: name,
                                          price: price,
                                          list: customizations,
                                        )),
                              );
                            },
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
      },
    );
  }
}
