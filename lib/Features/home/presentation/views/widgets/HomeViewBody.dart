import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'BestSellerListView.dart';
import 'BestSellerListViewItem.dart';
import 'CustomAppBar.dart';
import 'CustomListView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              FeaturedBooksListView(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books ',
                  style: Styles.textStyle18.copyWith(fontFamily: KGtSectraFine),
                ),
               ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BestSellerListView(),
        ))
      ],
    );
  }
}
