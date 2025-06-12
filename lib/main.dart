import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app/features/home/presentation/bloc/home_bloc.dart';

import 'features/data/models/user.dart';
import 'features/home/presentation/views/failure_view.dart';
import 'features/home/presentation/views/initial_view.dart';
import 'features/home/presentation/views/loading_view.dart';
import 'features/home/presentation/views/success_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My APP',
          home: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadSuccess) {
                List<User> users = state.users;
                return Success(users: users);
              } else if (state is HomeLoadInProgress) {
                return const LoadingView();
              } else if (state is HomeLoadFailure) {
                return const Failure();
              }
              return const InitialView();
            },
          )),
    );
  }
}
