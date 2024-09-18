import 'package:firebase_core/firebase_core.dart';
import 'package:diariodeviagens/firebase_options.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}