import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Map<String, String>> dummyData = [
    {
      'image':
          'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png',
      'title': 'Card 1',
      'description': 'Description for Card 1'
    },
    {
      'image':
          'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png',
      'title': 'Card 2',
      'description': 'Description for Card 2'
    },
    {
      'image':
          'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png',
      'title': 'Card 3',
      'description': 'Description for Card 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.9,
                // width: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    return ImageCard(
                      image: dummyData[index]['image']!,
                      title: dummyData[index]['title']!,
                      description: dummyData[index]['description']!,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image),
            const SizedBox(
              height: 10,
            ),
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
      ),
    );
  }
}
