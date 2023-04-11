import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class breakfast extends StatefulWidget {
  const breakfast({Key? key}) : super(key: key);

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> {
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> description = [];
  List<String> title = [];
  List<String> image = [];

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL
    var url = "https://restaurant-938-default-rtdb.firebaseio.com/" +
        "fooditems.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        description.add(blogData["description"]);
        title.add(blogData["title"]);
        image.add(blogData["image"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(

                      child: Card(
                        shape: Border(
                            left: BorderSide(color: Colors.blueGrey, width: 5)),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Image(
                                width: 200,
                                image: NetworkImage('${image[index]}'),
                              ),
                            ),
                            SizedBox(
                              child: ListTile(


                                title: Text("${title[index]}"),
                                subtitle: Text("${description[index]}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
    );
  }
}
