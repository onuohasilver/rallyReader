import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<void> saveImage(String imageName, String imageData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(imageName, imageData);
  }

  Future<String> getImage(String imageName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String imageData = sharedPreferences.getString(imageName);
    return imageData;
  }
}
