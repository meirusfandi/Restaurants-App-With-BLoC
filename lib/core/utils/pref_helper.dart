import 'package:recipe_app_bloc/core/utils/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefInstance;

class PrefHelper {
  bool? get getIsFirstOpen => prefInstance.getBool(PrefsKey.isFirstOpenApp.name);
  String? get getShowPermissionNotif => prefInstance.getString(PrefsKey.isShowPermissionNotification.name);

  void get clearData {
    prefInstance.remove(PrefsKey.isFirstOpenApp.name);
    prefInstance.remove(PrefsKey.isShowPermissionNotification.name);
  }
}

final prefHelper = PrefHelper();