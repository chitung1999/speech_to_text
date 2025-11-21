import 'package:injectable/injectable.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/domain/models/index.dart';
import 'package:speech_to_text/domain/network/rest_client.dart';

abstract class RemoteData {
  Future<dynamic> getUser(String id);
}

@Injectable(as: RemoteData)
class RemoteDataImpl implements RemoteData {
  final RestClient _restClient;

  RemoteDataImpl(this._restClient);

  @override
  Future<Result<dynamic>> getUser(String id) async {
    try {
      final result = await _restClient.getUser(id);
      return Result(data: result, status: Status.success);
    } catch (e) {
      return Result(data: null, status: Status.error);
    }
  }

  //POST
  // @override
  // Future<dynamic> getCreditBillingKey(
  //     String cardNo,
  //     String expireYear,
  //     String expireMonth,
  //     String password,
  //     String birthday,
  //     String phoneNumber,
  //     ) {
  //   final params = {
  //     "CardNo": AES256Cipher.encrypt(cardNo),
  //     "ExpireYear": AES256Cipher.encrypt(expireYear),
  //     "ExpireMonth": AES256Cipher.encrypt(expireMonth),
  //     "Password": AES256Cipher.encrypt(password),
  //     "Birthday": AES256Cipher.encrypt(birthday),
  //     "Token": AES256Cipher.encrypt(phoneNumber)
  //   };
  //
  //   return _walletClient.getCreditBillingKey(params);
  // }
}