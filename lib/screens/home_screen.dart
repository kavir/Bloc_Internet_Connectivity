// import 'package:example1/bloc/internet_bloc/internet_bloc.dart';
// import 'package:example1/bloc/internet_bloc/internet_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: BlocConsumer<InternetBloc, InternetState>(  //blocconsumer is the collection of bloclistener and blocbuilder

//           listener: (context, state) {
//             if(state is InternetGainedState){
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content:Text("Internet Connected"),
//                 backgroundColor: Colors.green,));
//             }
//             else if(state is InternetLostState){
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content:Text("Internet Disconnected"),
//                 backgroundColor: Colors.red,));
//             }
            
//           },
//           builder: (context, state) {
//             if(state is InternetGainedState){
//               return Text("Connected");
//             }
//             else if(state is InternetLostState){
//               return Text("Disconnected");
//             }
//             else{
//               return Text("Loading.. .");
//             }
//           },
//         ),

        
//       )),
//     );
//   }
// }


//////////cubit///////////////
///
///import 'package:example1/bloc/internet_bloc/internet_bloc.dart';
import 'package:example1/bloc/internet_bloc/internet_state.dart';
import 'package:example1/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(  //blocconsumer is the collection of bloclistener and blocbuilder
        
          listener: (context, state) {
            if(state == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:Text("Internet Connected"),
                backgroundColor: Colors.green,));
            }
            else if(state ==InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:Text("Internet Disconnected"),
                backgroundColor: Colors.red,));
            }
            
          },
          builder: (context, state) {
            if(state==InternetState.Gained){  //since we are uisng enum wo we need to use == to check a state else we will use a is for checking state
              return Text("Connected"); 
            }
            else if(state==InternetState.Lost){
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

