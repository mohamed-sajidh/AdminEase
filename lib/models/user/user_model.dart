import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String emailId;

  @HiveField(3)
  final String password;

  const UserModel(this.userId, this.name, this.emailId, this.password);
}
