import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app/features/home/presentation/bloc/home_bloc.dart';

import 'features/data/models/user.dart';
import 'features/home/presentation/views/failure_view.dart';
import 'features/home/presentation/views/initial_view.dart';
import 'features/home/presentation/views/loading_view.dart';
import 'features/home/presentation/views/success_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
          title: 'My APP',
          home: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadSuccess){
                User user = state.user;
                return Success(user: user);
              }else if (state is HomeLoadInProgress){
                return Loading();
              }else if (state is HomeLoadFailure){
                return Failure();
              }
              return InitialView();
            },
          )),
    );
  }
}
