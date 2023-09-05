import 'package:get/get.dart';
import 'package:meister2/globals/globals.dart';

class PostCmtProvider extends GetConnect{

  @override
  void onInit(){
    // 초기 데이터 설정용
    // 서버 URL 이나 대기시간 등
  }

  // Get 호출
  Future<Response> getLists(int post_id, String user_id, int pageKey) async {
    // Backend 로 요청할 URL 을 그대로 적어준다.
    final serverUrl = "${server_url}/post_cmts/list/${post_id}/${user_id}?page=${pageKey}";
    print("serverUrl = ${serverUrl}");
    final response = await get(serverUrl);
    return response;
  }


  // 해당 테이블 데이터 삽입
  Future<Response> insertContent(Map data) async {
    final server_api = "$server_url/post_cmts";

    print("server_api = ${server_api}");
    print("server_api data = ${data.toString()}");
    final response = await post(server_api, data);

    return response;
  }


  // 해당 테이블 데이터 수정
  Future<Response> updateContent(int post_cmt_id, Map data) async {
    final server_api = "$server_url/post_cmts/${post_cmt_id}";

    print("server_api = ${server_api}");
    print("server_api data = ${data.toString()}");
    final response = await put(server_api, data);

    return response;
  }



  // 해당 테이블 의 데이터 삭제
  Future<Response> deleteContent(int id) async {
    final server_api = "$server_url/post_cmts/${id}";

    print("server_api = ${server_api}");
    final response = await delete(server_api);

    return response;
  }
}