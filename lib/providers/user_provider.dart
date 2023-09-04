import 'package:get/get.dart';

class UserProvider extends GetConnect{

  @override
  void onInit(){
    // 초기 데이터 설정용
    // 서버 URL 이나 대기시간 등

  }

  // Get 호출
  Future<Response> getUserInfo(String user_id) async {
    // Backend 로 요청할 URL 을 그대로 적어준다.
    final serverUrl = "http://15.152.120.126/api/users/${user_id}";

    final response = await get(serverUrl);
    return response;
  }
}