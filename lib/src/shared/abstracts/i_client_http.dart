import 'package:dartz/dartz.dart';
import 'package:digivice/src/shared/failures/failure.dart';

abstract class IClientHttp {
  Future<Either<Failure, dynamic>> get(String url,
      {Map<String, String>? headers});
}
