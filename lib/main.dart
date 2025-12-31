import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silancar_bloc/src/ui/auth/login/cubit/login_cubit.dart';
import 'package:silancar_bloc/src/ui/auth/login/view/login_view.dart';
import 'package:silancar_bloc/src/ui/profile/cubit/profile_cubit.dart';
import 'package:silancar_bloc/src/utils/app_messenger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: AppMessenger.messengerKey,
        title: 'Flutter Demo',
        home: const LoginPage(),
      ),
    );
  }
}
