import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeSearchPressed>((event, emit) async {
      emit(HomeLoadInProgress());
      final url = Uri.parse('https://randomuser.me/api/?results=10');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> objectMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        final UserResponse userResponse = UserResponse.fromJson(objectMap);
        emit(HomeLoadSuccess(userResponse.users));
      } else {
        emit(HomeLoadFailure());
      }
    });
  }
}
