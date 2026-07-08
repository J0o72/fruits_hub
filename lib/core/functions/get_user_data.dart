import 'dart:convert';

import 'package:fruit_hub/core/helpers/shared_pref_keys.dart';
import 'package:fruit_hub/core/helpers/shared_pref_singleton.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  var jsonString = SharedPrefSingleton.getString(SharedPrefKeys.userData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntity;
}
