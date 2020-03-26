import 'package:flutter_app/data/dioHelper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenericProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<dynamic> getFoo() async {
    DioHelper dioHelper = DioHelper.instance;
    return dioHelper.get("/ditto");
  }
}
