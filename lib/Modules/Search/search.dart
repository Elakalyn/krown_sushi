import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:krown_sushi/Shared/Components/components.dart';
import 'package:krown_sushi/cubit/app_cubit.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 20.0, left: 20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              backgroundColor: HexColor('6750A4'),
                            ),
                          ),
                        ),
                        20.h,
                        TextField(
                            onChanged: (value) {
                              AppCubit.get(context).searchQuery = value;
                            },
                            onSubmitted: (value) {
                              AppCubit.get(context).performSearch();
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                            ),
                          ),
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
                          ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => 20.h,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                AppCubit.get(context).searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              final docSnapshot = AppCubit.get(context).searchResults[index];
                              // Display the relevant data from the document snapshot
                              return suggestionDishCard(
                                name: docSnapshot['name'],
                                price: docSnapshot['price'],
                                image: docSnapshot['image'],
                                desc: docSnapshot['description'],
                              );
                            },
                          ),
                          40.h,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
