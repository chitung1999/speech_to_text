import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/models/index.dart';
import 'package:speech_to_text/domain/models/login/login_response.dart';
import 'package:speech_to_text/domain/models/record/record_response.dart';
import 'package:speech_to_text/domain/network/rest_client.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';

abstract class RemoteData {
  Future<Result<LoginResponse>> onLogin(String username, String password);
  Future<Result<RecordResponse>> onSpeechToText();
}

@Injectable(as: RemoteData)
class RemoteDataImpl implements RemoteData {
  final RestClient _restClient;
  final _prefs = getIt<SharedPreferencesApp>();

  RemoteDataImpl(this._restClient);

  @override
  Future<Result<LoginResponse>> onLogin(String username, String password) async {
    try {
      final params = {
        "username": username,
        "password": password
      };

      // final result = await _restClient.onLogin(params);
      //nctung2 dummy
      final result = LoginResponse(result: true, name: 'Tung', token: 'fake-token');

      await _prefs.setToken(result.token);
      await _prefs.setFullName(result.name);
      updateToken(result.token);

      return Result(data: result, status: Status.success);
    } catch (e) {
      return Result(data: null, status: Status.error);
    }
  }

  @override
  Future<Result<RecordResponse>> onSpeechToText() async {
    try {
      // final dir = await getTemporaryDirectory();
      // final path = p.join(dir.path, 'record.m4a');
      // final file = MultipartFile.fromFileSync(path, filename: p.basename(path));
      // final result = await _restClient.onSpeechToText(file);
      //nctung2 dummy
      final result = RecordResponse(status: true, text: 'This is response from whisper', command: 'Hello!');

      return Result(data: result, status: Status.success);
    } catch (e) {
      return Result(data: null, status: Status.error);
    }
  }
}