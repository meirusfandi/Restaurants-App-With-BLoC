import 'package:recipe_app_bloc/core/utils/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefInstance;

class PrefHelper {
  String? get getSavedAppVersion => prefInstance.getString(PrefsKey.savedAppVersion.name);
  String? get getDateUpdateAppears => prefInstance.getString(PrefsKey.dateUpdateAppears.name);
  String? get getShowPermissionNotif => prefInstance.getString(PrefsKey.isShowPermissionNotification.name);

  void get clearData {
    prefInstance.remove(PrefsKey.savedAppVersion.name);
    prefInstance.remove(PrefsKey.dateUpdateAppears.name);
    prefInstance.remove(PrefsKey.isShowPermissionNotification.name);
  }
}

final prefHelper = PrefHelper();