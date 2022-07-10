import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:digivice/src/shared/abstracts/i_client_http.dart';
import 'package:digivice/src/shared/failures/failure.dart';
import 'package:digivice/src/shared/failures/server_failure.dart';
import 'package:http/http.dart' as http;

class HTTPClient extends IClientHttp {
  final _client = http.Client();

  @override
  Future<Either<Failure, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    try {
      return await _client.get(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          return right(json.decode(response.body));
        } else {
          return left(ServerFailure(
              mensage: 'Error HTTP Server Code: ${response.statusCode}'));
        }
      });
    } catch (error, stackTrace) {
      return left(ServerFailure(
        mensage: error.toString(),
        stackTrace: stackTrace.toString(),
      ));
    }
  }
}
