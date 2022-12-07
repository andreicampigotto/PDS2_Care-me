import 'dart:convert';
import 'dart:math';
import 'package:care/models/user.dart';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class UserList with ChangeNotifier {
  final List<User> _items = DAMMY_USER;

  List<User> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('${Constants.USER_BASE_URL}.json'),
      body: jsonEncode(
        {
          'fullName': user.fullName,
          'birthday': user.birthday,
          'bloodType': user.bloodType,
          'emergencyPhone': user.emergencyPhone,
          'imageUrl': user.imageUrl,
          'height': user.height,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      User(
        userId: id,
        fullName: user.fullName,
        birthday: user.birthday,
        bloodType: user.bloodType,
        emergencyPhone: user.emergencyPhone,
        imageUrl: user.imageUrl,
        height: user.height,
      ),
    );
    notifyListeners();
  }

  Future<void> loadUser() async {
    final response = await http.get(
      Uri.parse('${Constants.USER_BASE_URL}.json'),
    );

    if (response.body == 'null') return;
    _items.clear();
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((userId, userData) {
      _items.add(
        User(
          userId: userId,
          fullName: userData.fullName['fullName'],
          birthday: userData.birthday['birthday'],
          bloodType: userData.bloodType['bloodType'],
          emergencyPhone: userData.emergencyPhone['emergencyPhone'],
          imageUrl: userData.imageUrl['imageUrl'],
          height: userData.height['height'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveUserFromData(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final user = User(
      userId:
          hasId ? data['userId'] as String : Random().nextDouble().toString(),
      fullName: data['fullName'] as String,
      emergencyPhone: data['emergencyPhone'] as String,
      bloodType: data['bloodType'] as String,
      imageUrl: data['imageUrl'] as String,
      height: data['height'] as double,
      birthday: DateTime.now(),
    );

    if (hasId) {
      return updateUser(user);
    } else {
      return addUser(user);
    }
  }

  Future<void> updateUser(User user) async {
    int index = _items.indexWhere((u) => u.userId == user.userId);

    if (index >= 0) {
      await http.patch(
        Uri.parse('${Constants.USER_BASE_URL}/${user.userId}.json'),
        body: jsonEncode(
          {
            "fullName": user.fullName,
            "height": user.height,
            "bloodType": user.bloodType,
            "emergencyPhone": user.emergencyPhone,
            "imageUrl": user.imageUrl,
            "birthday": user.birthday
          },
        ),
      );

      _items[index] = user;
      notifyListeners();
    }
  }
}
