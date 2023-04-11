import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/photos_model.dart';

class ExampleTwo extends StatefulWidget {
  final String title;
  const ExampleTwo({required this.title, super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<PhotosModel> photosList = [];

  Future<List<PhotosModel>> getPhotosApi() async {
    const String url = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        photosList.add(
          PhotosModel(
            title: i['title'],
            url: i['url'],
            id: i['id'],
          ),
        );
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: photosApi(),
    );
  }

  Widget photosApi() {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getPhotosApi(),
            builder: (
              context,
              AsyncSnapshot<List<PhotosModel>> snapshot,
            ) {
              if (!snapshot.hasData) {
                /*
                
                1)  ! Bang Operator
                2)  Null Assertion Operator
                3)  A Variable or Expression is Not Null

                 */
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    semanticsLabel: 'Circular progress indicator',
                  ),
                );

                // return const Text(
                //   'Loading...........',
                // );
              } else {
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        // backgroundImage: AssetImage(
                        //   'assets/images/imran.jpg',

                        backgroundImage: NetworkImage(
                          snapshot.data![index].url.toString(),
                        ),
                      ),
                      title: Text(
                        'Roll No : ${snapshot.data![index].id.toString()}',
                      ),
                      subtitle: Text(
                        snapshot.data![index].title.toString(),
                      ),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
