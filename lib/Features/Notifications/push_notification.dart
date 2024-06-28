import 'package:firebase_messaging/firebase_messaging.dart';

import '../../main.dart';

class PushNotifications {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> init() async {
    // Solicitar permisos
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Obtener el token de registro
    final token = await _firebaseMessaging.getToken();
    print('Device token: $token');

    // Configurar el manejo de mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(
            "Mensaje recibido: ${message.notification!.title}, ${message.notification!.body}");
      }
    });

    // Configurar el manejo de mensajes cuando la app está en segundo plano y se toca la notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Notificación en segundo plano tocada');
        // Navegar a la página HomeView cuando se toca la notificación
        navigatorKey.currentState?.pushNamed('/home', arguments: message);
      }
    });
  }
}
