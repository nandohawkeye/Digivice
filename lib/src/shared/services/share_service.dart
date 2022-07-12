import 'package:digivice/src/shared/abstracts/i_share_service.dart';
import 'package:share_plus/share_plus.dart';

class ShareService extends IShareService {
  @override
  Future<void> share(String url, String mensage) async =>
      await Share.share(url, subject: mensage);
}
