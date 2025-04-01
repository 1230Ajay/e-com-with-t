import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapp/core/utils/constants/app_storage_constants.dart';

class StorageService {
  StorageService._(); // Private constructor for singleton

  static final StorageService instance = StorageService._();
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  Future setAppIsOpened() async{
    return await _prefs?.setBool(AppStorageConstants.IS_APP_OPEN_FIRST_TIME, true);
  }

  bool isAppOpened(){
    return _prefs!.getBool(AppStorageConstants.IS_APP_OPEN_FIRST_TIME)??false;
  }

}
