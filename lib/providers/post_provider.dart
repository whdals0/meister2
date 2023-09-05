import 'package:get/get.dart';
import 'package:meister2/globals/globals.dart';

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


  // 상세 데이터 호출
  Future<Response> getDetail(int post_id, String user_id) async {
    // Backend 로 요청할 URL 을 그대로 적어준다.
    final serverUrl = "${server_url}/posts/detail/${post_id}/${user_id}";
    print("serverUrl = ${serverUrl}");
    final response = await get(serverUrl);
    return response;
  }


  // 해당 테이블 의 데이터 삭제
  Future<Response> deleteContent(int id) async {
    final server_api = "$server_url/posts/${id}";

    print("server_api = ${server_api}");
    final response = await delete(server_api);

    return response;
  }
}