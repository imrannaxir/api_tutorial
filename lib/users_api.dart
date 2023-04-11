import 'dart:convert';

import 'package:api_tutorial/Models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersApi extends StatefulWidget {
  final String title;
  const UsersApi({required this.title, super.key});

  @override
  State<UsersApi> createState() => _UsersApiState();
}

class _UsersApiState extends State<UsersApi> {
  /*
  
  
   */
  List<UsersModel> usersList = [];
  Future<List<UsersModel>> getUsersApi() async {
    const String url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        var ii = i as dynamic;
        usersList.add(UsersModel.fromJson(ii));
      }
      return usersList;
    } else {
      return usersList;
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
      body: usersApi(),
    );
  }

  Widget usersApi() {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    semanticsLabel: 'Circular progress indicator',
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ReusableRow(
                                title: 'Name : ',
                                value: snapshot.data![index].name.toString()),
                            const SizedBox(height: 10),
                            ReusableRow(
                                title: 'UserName : ',
                                value:
                                    snapshot.data![index].username.toString()),
                            const SizedBox(height: 10),
                            ReusableRow(
                                title: 'EMail : ',
                                value: snapshot.data![index].email.toString()),
                            const SizedBox(height: 10),
                            ReusableRow(
                                title: 'Address : ',
                                value: snapshot.data![index].address!.city
                                    .toString()
                                //      +
                                // snapshot.data![index].address!.geo!.lng
                                //     .toString(),
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
        ),
      ],
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 5,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 5,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
