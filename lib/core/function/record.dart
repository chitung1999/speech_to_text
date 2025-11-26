import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

abstract class RecordApp {
  static AudioRecorder recorder = AudioRecorder();

  static Future<void> startRecording() async {
    if (await recorder.isRecording()) {
      return;
    }

    final dir = await getTemporaryDirectory();
    final path = p.join(dir.path, 'record.m4a');

    //remove old file
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }

    try {
      await recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
          numChannels: 1,
        ),
        path: path,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<void> endRecording() async {
    try {
      await recorder.stop();
    } catch (e) {
      print(e);
    }
  }
}
