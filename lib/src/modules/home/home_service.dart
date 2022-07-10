import 'package:dartz/dartz.dart';
import 'package:digivice/src/shared/abstracts/i_client_http.dart';
import 'package:digivice/src/shared/abstracts/urls_constrants.dart';
import 'package:digivice/src/shared/failures/failure.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:digivice/src/shared/services/http_client.dart';

class HomeService {
  final IClientHttp _client = HTTPClient();

  Future<Either<Failure, List<DigimonModel>>> getDigimons() async {
    final result = await _client.get(UrlsConstrants.getAllDigimons);

    return result.fold(
        (failure) => left(failure),
        (data) => right(data
            .map<DigimonModel>((digimon) => DigimonModel.fromJson(digimon))
            .toList()));
  }
}
