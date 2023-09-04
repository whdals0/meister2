import 'package:get/get.dart';

class PostProvider extends GetConnect{

  @override
  void onInit(){
    // 초기 데이터 설정용
    // 서버 URL 이나 대기시간 등
  }

  // Get 호출
  Future<Response> getPosts(String user_id) async {
    // Backend 로 요청할 URL 을 그대로 적어준다.
    final serverUrl = "http://15.152.120.126/api/posts/list/${user_id}";
    print("serverUrl = ${serverUrl}");
    final response = await get(serverUrl);
    return response;
  }
}