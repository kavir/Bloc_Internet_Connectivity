import 'package:example1/bloc/internet_bloc/internet_bloc.dart';
import 'package:example1/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(  //blocconsumer is the collection of bloclistener and blocbuilder
        
          listener: (context, state) {
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:Text("Internet Connected"),
                backgroundColor: Colors.green,));
            }
            else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:Text("Internet Disconnected"),
                backgroundColor: Colors.red,));
            }
            
          },
          builder: (context, state) {
            if(state is InternetGainedState){
              return Text("Connected");
            }
            else if(state is InternetLostState){
              return Text("Disconnected");
            }
            else{
              return Text("Loading.. .");
            }
          },
        ),

        
      )),
    );
  }
}
