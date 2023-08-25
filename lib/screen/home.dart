import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screen/details.dart';
import 'package:test_app/widgets/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List<bool> favoriteStates = [];

  @override
  void initState() {
    super.initState();
    // Initialize favorite states to false for all items
    favoriteStates = List.generate(dummyData.length, (index) => false);
  }

  void toggleFavorite(int index) {
    setState(() {
      favoriteStates[index] = !favoriteStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future<void> _fetchData() async {
    //   try {
    //     final newData = await fetchDataFromAPI();
    //     setState(() {
    //       dummyData = newData;
    //     });
    //   } catch (e) {
    //     // Handle error
    //   }
    // }

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
                height: MediaQuery.of(context).size.height * 0.9,
                child: dummyData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: dummyData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(Details(
                                  image: dummyData[index]['image']!,
                                  title: dummyData[index]['title']!,
                                  description: dummyData[index]
                                      ['description']!));
                            },
                            child: ImageCard(
                              press: () {
                                toggleFavorite(index);
                              },
                              isFavorite: favoriteStates[index],
                              image: dummyData[index]['image']!,
                              title: dummyData[index]['title']!,
                              description: dummyData[index]['description']!,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
