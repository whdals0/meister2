import 'package:get/get.dart';

import '../globals/globals.dart';

class LikeProvider extends GetConnect{

  @override
  void onInit(){
    // 초기 데이터 설정용
    // 서버 URL 이나 대기시간 등
  }

  // 해당 테이블 데이터 삽입
  Future<Response> insertContent(Map data) async {
    final server_api = "$server_url/likes";

    print("server_api = ${server_api}");
    print("server_api data = ${data.toString()}");
    final response = await post(server_api, data);

    return response;
  }


  // 해당 테이블 의 데이터 삭제
  Future<Response> deleteContent(int id) async {
    final server_api = "$server_url/likes/${id}";

    print("server_api = ${server_api}");
    final response = await delete(server_api);

    return response;
  }
}