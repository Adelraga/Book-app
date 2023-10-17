import 'package:bookly/Features/search/presentation/views/widget/custom-search-listview.dart';
import 'package:bookly/core/utils/customLoadingIndicaor.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/widgets/errorMessage.dart';
import '../../../../home/presentation/views/widgets/BestSellerListViewItem.dart';
import 'CustomSearchTextField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
        
          return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CustomSearchTextField(),
              SizedBox(height: 16),
              Text(
                'Search Result',
                style: Styles.textStyle18,
              ),
              SizedBox(height: 20),
              Expanded(child: CustomSearchListView()),
            ],
          ),
        );
        

  }
}
