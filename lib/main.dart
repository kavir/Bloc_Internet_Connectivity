// import 'package:example1/bloc/internet_bloc/internet_bloc.dart';
// import 'package:example1/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InternetBloc(),
//       child: MaterialApp(
//         home: HomeScreen(),
//       ),
//     );
//   }
// }


// cubit///////////////////////////////////

import 'package:example1/bloc/internet_bloc/internet_bloc.dart';
import 'package:example1/cubits/internet_cubit.dart';
import 'package:example1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
