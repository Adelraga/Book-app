import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view_model/cubit/search_cubit.dart';


class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
   final myController = TextEditingController();
  late String searchType;

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        suffixIconColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        hintText: 'Search',
        
        suffixIcon: IconButton(
          
          onPressed: () {
            searchType=myController.text;
             BlocProvider.of<SearchCubit>(context).fetchSearchBooks(booksType:searchType  );
          },
          icon: Opacity(
            opacity: .8,
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
