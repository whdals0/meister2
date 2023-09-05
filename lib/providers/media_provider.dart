import 'package:get/get.dart';

import '../globals/globals.dart';

class MediaProvider extends GetConnect{

  @override
  void onInit(){
    // 초기 데이터 설정용
    // 서버 URL 이나 대기시간 등
  }


  Future<Response> uploadFile(String filePath, String fileName) async {
    final server_api = "${server_url}/medias";

    final httpClient = GetConnect();
    httpClient.timeout = Duration(seconds: 30);

    //print("server_api = $server_api");
    // print("server_data = $data");
    final formData = FormData({
      'media':  MultipartFile(filePath, filename: fileName),
    });
    final response = await httpClient.post(server_api, formData);
    return response;
  }
}