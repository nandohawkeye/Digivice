import 'package:digivice/src/shared/failures/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required mensage, stackTrace})
      : super(mensage: mensage, stackTrace: stackTrace);
}
