import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  SharedPreferences _preferences;
  UserSession() {
    SharedPreferences.getInstance().then((value) => this._preferences = value);
  }

  void saveSessionUser(User user) {
    _preferences.setString("id", user.id);
    _preferences.setString("email", user.email);
    _preferences.setString("username", user.username);
    _preferences.setString("city", user.city);
    _preferences.setString("birthDay", Util.convertDateToString(user.birthDay));
    _preferences.setString("password", user.password);
    _preferences.setString("profileImg", user.profileImg);
    _preferences.setDouble("rank", user.rank);
  }

  Future<bool> destroySession(User user) async {
    bool returnValue = false;
    _preferences.clear().then((value) => {returnValue = value});
    return returnValue;
  }

  User getCurrentUser() {
    User currentUser = new User(
      id: _preferences.getString("id") ?? '0',
      email: _preferences.getString("email") ,
      username: _preferences.getString("username"),
      city: _preferences.getString("city"),
      birthDay: Util.convertToDateTime(_preferences.getString("birthDay")),
      profileImg: _preferences.getString("profileImg"),
      rank: _preferences.getDouble("rank"),
    );
    return currentUser;
  }
}
