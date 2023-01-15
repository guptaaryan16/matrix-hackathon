// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'package:tflite/tflite.dart';


// this function is used to fetch the correct phenome sequence of words that can help us in comparison
Future<List<String>> fetchCorrectPhonemeSequence(String word) async {
  var headers = {"Authorization": "Bearer {API_TOKEN}"};
  var data = "used word";
  final response = await http.post(Uri.parse('https://api-inference.huggingface.co/models/bookbot/wav2vec2-ljspeech-gruut'),headers:headers, body: data );
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as List;
    return data.map((d) => d as String).toList();
  } else {
    throw Exception('Failed to fetch phoneme sequence');
  }
}

// this function is a model that can help us convert audio into the exact phenome sequence of the audio word
/*
Future<void> loadModel() async {
  await Tflite.loadModel(
    model: "assets/phoneme_classifier.tflite",
    labels: "assets/phoneme_labels.txt",
  );
}

Future<List?> predict(Uint8List input) async {
  return await Tflite.runModelOnBinary(binary: input);
}


// this can help us find the exact distance between the phenome sequences and this is ranged between 0 and 1
double getDTWDistance(List<String> sequence1, List<String> sequence2) {
  final int m = sequence1.length;
  final int n = sequence2.length;

  // ignore: deprecated_member_use
  final List<List<double>> dtw = []..length = n;
  // initialize the first element of the dtw matrix
  dtw[0][0] = 0;

  // initialize the first row and column
  for (int i = 1; i < m; i++) {
    dtw[i][0] = double.infinity;
  }
  for (int j = 1; j < n; j++) {
    dtw[0][j] = double.infinity;
  }

  // calculate the DTW distance
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      final double cost = (sequence1[i] != sequence2[j]) ? 1 : 0;
      dtw[i][j] =
          cost + min(min(dtw[i - 1][j], dtw[i][j - 1]), dtw[i - 1][j - 1]);
    }
  }

  return dtw[m - 1][n - 1];
}
*/

