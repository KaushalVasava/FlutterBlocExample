import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttor_app/cubit/internet_cubit/internet_cubit.dart';
import 'package:fluttor_app/cubit/internet_cubit/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home"),
        ),
        body: SafeArea(
            child: Center(
          //blockBuilder used for UI operation
          //blockListener used for background task like do so calculation, navigation etc
          //blockConsumer used for Both task UI and background
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Not Connected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                return const Text("Connected");
              } else if (state == InternetState.lost) {
                return const Text("Not connected");
              } else {
                return const Text("Loading...");
              }
            },
          ),
        )));
  }
}
