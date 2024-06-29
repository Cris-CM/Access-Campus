import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    receiveDataWhenStatusError: true,
  ),
);
