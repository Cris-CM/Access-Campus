import 'package:qr_tracker/core/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> login(String username, String password) async {
    final user = await supabase.auth.signInWithPassword(
        email: "$username@ucvvirtual.edu.pe", password: password);

    return user;
  }

  Future<UsersModel> getUserByUID(String uid) async {
    final user = await supabase.from("Users").select().eq("uid", uid);
    if (user.isEmpty) {
      throw "Usuario no encontrado";
    }

    return UsersModel.fromJson(user.first);
  }

  Future<UsersModel> getUserByID(int id) async {
    final user = await supabase.from("Users").select().eq("id", id);
    if (user.isEmpty) {
      throw "Usuario no encontrado";
    }

    return UsersModel.fromJson(user.first);
  }
}
