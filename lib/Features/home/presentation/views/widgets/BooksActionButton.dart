import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/book/book.dart';
import '../../../../../core/widgets/CustomButton.dart';


class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.bookModel});
final Book bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {
                
              },
              title: '19.99',
              textColor: Colors.black,
              buttonColor: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async{
                 Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                  if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');    
                    }
              },
              title: 'Free Preview',
              textColor: Colors.white,
              buttonColor: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
