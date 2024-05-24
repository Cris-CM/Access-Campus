import 'package:dio/dio.dart';
import 'package:qr_tracker/core/statics/const.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: BASEURL,
    receiveDataWhenStatusError: true,
  ),
);
