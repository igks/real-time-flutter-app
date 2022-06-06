import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_demo/bloc/page_bloc.dart';

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  final Stream<DocumentSnapshot> documentStream = FirebaseFirestore.instance
      .collection('price-list')
      .doc('rkCX7HE0lBAGKwdAsYHW')
      .snapshots();

  late StreamSubscription statusStream;

  int price1 = 0;
  int price2 = 0;
  int price3 = 0;

  void loadPrice() {
    FirebaseFirestore.instance
        .collection('price-list')
        .doc('rkCX7HE0lBAGKwdAsYHW')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('${documentSnapshot.data()}');
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          price1 = data['price1'];
          price2 = data['price2'];
          price3 = data['price3'];
        });
      }
    });
  }

  void streamPrice() {
    var firebaseStream =
        FirebaseFirestore.instance.collection('price-list').snapshots();

    statusStream = firebaseStream.listen((event) {
      loadPrice();
    });
  }

  @override
  void initState() {
    super.initState();
    loadPrice();
    streamPrice();
  }

  @override
  void dispose() {
    statusStream.cancel();
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
          title: Text("Client Side"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Price 1 : $price1'),
            SizedBox(
              height: 20,
            ),
            Text('Price 2 : $price2'),
            SizedBox(
              height: 20,
            ),
            Text('Price 3 : $price3'),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}
