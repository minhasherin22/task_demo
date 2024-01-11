import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHome extends StatefulWidget {
  const SharedHome({super.key});

  @override
  State<SharedHome> createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  late SharedPreferences preferences;
  late String username;
  late String password;

  @override

  ///page load aakumbo thanne datas kanenm so njammal initstate use aakunn
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sales Estimate"),
          actions: [
            Icon(Icons.add)
          ],
        ),
        body: ListView.builder(itemBuilder: (context, index) {
        ListTile(
          title: const Text("invoice number"),
          subtitle: Text('$username'),
        );
      })),
    );
  }

  void fetchData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('uname')!;
      password = preferences.getString('pword')!;
    });
  }
}
