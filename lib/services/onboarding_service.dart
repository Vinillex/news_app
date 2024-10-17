import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  Future<bool> isOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    final isName = prefs.containsKey('name');
    final isCategories = prefs.containsKey('categories');
    return isName && isCategories;
  }

  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  Future<void> setCategories(List<String> categories) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('categories', categories);
  }

  Future<void> setCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', city);
  }

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<List<String>?> getCategories() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('categories');
  }

  Future<String?> getCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('city');
  }
}
