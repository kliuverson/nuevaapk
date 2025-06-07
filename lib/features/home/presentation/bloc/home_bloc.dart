import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeSearchPressed>((event, emit) async{
      emit(HomeLoadInProgress());
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      final response = await http.get(url);
      if (response.statusCode == 200){
        Map objectMap = jsonDecode(response.body);
        User user = User(objectMap);
        emit(HomeLoadSuccess(user));
      }else{
        emit(HomeLoadFailure());
      }

    });
  }
}
