// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

// Clase que nos servirá de molde para poder tener retornos de valores con diferentes tipos
// Generalmente usado cuando se regresa un valor desde un servicio
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({
    this.data,
    this.error,
  });
}

class DataSucces<T> extends  DataState<T>{
  DataSucces(T data) :super(data: data); 
}

class DataError<T> extends  DataState<T>{
  DataError(DioException error) :super(error: error); 
}
