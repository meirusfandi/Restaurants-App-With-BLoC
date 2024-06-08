import 'package:recipe_app_bloc/core/utils/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefInstance;

class PrefHelper {
  bool? get getIsFirstOpen => prefInstance.getBool(PrefsKey.isFirstOpenApp.name);
  String? get getShowPermissionNotif => prefInstance.getString(PrefsKey.isShowPermissionNotification.name);
  String? get getVersionApp => prefInstance.getString(PrefsKey.versionApp.name);
  String? get getBuildNumber => prefInstance.getString(PrefsKey.buildNumber.name);

  void get clearData {
    prefInstance.remove(PrefsKey.isFirstOpenApp.name);
    prefInstance.remove(PrefsKey.isShowPermissionNotification.name);
    prefInstance.remove(PrefsKey.versionApp.name);
    prefInstance.remove(PrefsKey.buildNumber.name);
  }
}

final prefHelper = PrefHelper();