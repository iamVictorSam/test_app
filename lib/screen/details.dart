import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Image.network(image),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16),
            child: Text(
              description,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
