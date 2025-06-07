import 'dart:convert';
import 'dart:io';

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

      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final Map<String, dynamic> objectMap =
              jsonDecode(response.body) as Map<String, dynamic>;
          final UserResponse userResponse = UserResponse.fromJson(objectMap);
          emit(HomeLoadSuccess(userResponse.users));
        } else {
          emit(HomeLoadFailure(
              'Error del servidor: código ${response.statusCode}'));
        }
      } on SocketException {
        emit(const HomeLoadFailure('Sin conexión a Internet.'));
      } on FormatException {
        emit(const HomeLoadFailure('Respuesta de formato incorrecto.'));
      } catch (e) {
        emit(HomeLoadFailure('Error inesperado: $e'));
      }
    });
  }
}
