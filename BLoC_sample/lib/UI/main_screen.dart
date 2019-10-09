import 'package:flutter/material.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/location_bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        // 2
        if (location == null) {
          return LocationScreen();
        }

        return Container();
      }
    );
  }
}