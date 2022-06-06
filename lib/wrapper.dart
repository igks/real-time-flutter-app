import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_demo/bloc/page_bloc.dart';
import 'package:real_time_demo/client.dart';
import 'package:real_time_demo/menu.dart';
import 'package:real_time_demo/server.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnMenuPage) {
        return const Menu();
      } else if (pageState is OnClientPage) {
        return const Client();
      } else if (pageState is OnServerPage) {
        return const Server();
      } else {
        return const Menu();
      }
    });
  }
}
