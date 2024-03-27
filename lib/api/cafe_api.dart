import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //base url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      throw ('Error en el Get ', e);
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final fromData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: fromData);
      return resp.data;
    } catch (e) {
      throw ('Error en el Post ', e);
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final fromData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: fromData);
      return resp.data;
    } catch (e) {
      throw ('Error en el Post ', e);
    }
  }
  static Future httpDelete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } catch (e) {
      throw ('Error en el Post ', e);
    }
  }
}
