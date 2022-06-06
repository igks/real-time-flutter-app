import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_demo/bloc/page_bloc.dart';

class Server extends StatefulWidget {
  const Server({Key? key}) : super(key: key);

  @override
  State<Server> createState() => _ServerState();
}

class _ServerState extends State<Server> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  CollectionReference doc = FirebaseFirestore.instance.collection('price-list');

  void manualUpdate() {
    doc.doc('rkCX7HE0lBAGKwdAsYHW').update({
      'price1': int.parse(_controller1.text),
      'price2': int.parse(_controller2.text),
      'price3': int.parse(_controller3.text)
    });
  }

  void autoUpdate() async {
    var rand = Random();
    for (int i = 0; i < 10; i++) {
      doc.doc('rkCX7HE0lBAGKwdAsYHW').update({
        'price1': rand.nextInt(20),
        'price2': rand.nextInt(20),
        'price3': rand.nextInt(20)
      });
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(ToMenu());
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Server Side'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                style: TextStyle(height: 0.5),
                controller: _controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Update Price 1",
                    hintText: "Update Price 1"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(height: 0.5),
                controller: _controller2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Update Price 2",
                    hintText: "Update Price 2"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(height: 0.5),
                controller: _controller3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Update Price 3",
                    hintText: "Update Price 3"),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  manualUpdate();
                },
                child: Center(child: Text("Manual Update")),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  autoUpdate();
                },
                child: Center(child: Text("Auto Update")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
