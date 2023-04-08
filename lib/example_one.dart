import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/models_name.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({required this.title, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postList = [];
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        //  postList.clear();
        var ii = i as dynamic;
        postList.add(PostsModel.fromJson(ii));
      }
      return postList;
    } else {
      return postList;
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
      body: apiTutorial(),
    );
  }

  Widget apiTutorial() {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
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
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Title : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              postList[index].title.toString(),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Description :',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              postList[index].body.toString(),
                            ),
                          ],
                        ),
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
