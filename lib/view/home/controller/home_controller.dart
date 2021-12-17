
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  late SpeechToText _speechToText;

  Rx<bool> _speechEnabled = false.obs;
  bool get speecEnabled => _speechEnabled.value;
  set speecEnabled(bool val) => _speechEnabled.value = val;


  Rx<String> _lastWords = ''.obs;
  String get lastWords => _lastWords.value;
  set lastWords(String val) => _lastWords.value = val;
  


  @override
  void onInit()  {
    print("hello");
    _speechToText = SpeechToText();
    asyncInit();
    super.onInit();
  }

  void asyncInit() async {
  await _speechToText.initialize();
  }

  void startListening() async {
    speecEnabled = true;
    await _speechToText.listen(onResult: _onSpeechResult);
  
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
      lastWords= result.recognizedWords;
  }

    void stopListening() async {
      speecEnabled = false;
    await _speechToText.stop();
   
  }



}