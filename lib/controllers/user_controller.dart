import 'package:get/get.dart';
import '../models/user.dart';

class UserController extends GetxController{

  final user = User(id: 0, auth_type: '', user_id: '', auth_id: '', passwd: '', fcm_token: '', nickname: '', status: '', created_at: '', updated_at: '', email: '', filepath: '').obs;

  void updateUser(User newUser) {
    user(newUser);
  }

}