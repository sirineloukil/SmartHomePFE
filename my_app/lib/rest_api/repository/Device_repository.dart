import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/rest_api/models/Device_model.dart';

class DeviceRepository {
  String url = 'http://172.16.0.192:8082/api/v1/devices';
  String key =
      "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJJY3hFNzhmOHhNZ2ZFUUdzTTZzdUZDbDFsbW5ZaFItWEJLbTREbHh4SlJFIn0.eyJleHAiOjE2NjMzNTc0NTUsImlhdCI6MTY2MzMyMTYxMSwianRpIjoiMTI4ZTc3ZmUtNzQ0Ny00N2Q0LWJjODYtNjhjZGU4YTBjYzdmIiwiaXNzIjoiaHR0cDovLzAuMC4wLjA6ODA4MC9yZWFsbXMvc21hcnRob21lIiwiYXVkIjpbInJlYWxtLW1hbmFnZW1lbnQiLCJhY2NvdW50Il0sInN1YiI6ImQzNmVmMDE5LTA3ZjItNDkzZi1iOTM3LWNlMzExMTk2OWMyZSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImxvZ2luLWFwcCIsInNlc3Npb25fc3RhdGUiOiIzMjhmODM2YS05M2Q3LTQxOWUtOTk2MC1iZDYxYTljYzQ0ZjYiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwiZGVmYXVsdC1yb2xlcy1zbWFydGhvbWUiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7InJlYWxtLW1hbmFnZW1lbnQiOnsicm9sZXMiOlsibWFuYWdlLXVzZXJzIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIiwic2lkIjoiMzI4ZjgzNmEtOTNkNy00MTllLTk5NjAtYmQ2MWE5Y2M0NGY2IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJ1c2VyMiIsImVtYWlsIjoidXNlcjJAZ21haWwuY29tIn0.OQRDHzJHXONgUtHdn9y4M2z8cty0yEK9E00NMywBvSg9gePALVN2v_1RMFO9yDYpNkm7qYkVF2avZx489RzT9ODOIvb1v6XxguGSWyk7ug2lJeCfW2wFqP8mykb-YPQs-iIXcfhTNygdtxJt9_3pmjnsI3j6-t3a0_YZ70EvYbKD57tfxpcApXGnuSHpYciWe-sxA35dGh3ZETsdg5Pi5WGMHrlfV-UpeM_ESD9onamRXMFCcm4Rf6xjEAMPFz0Kbw8bzR0X-Mfj5y_34Ce8XEQAQDzHMevoOSZ85TaqE8iA-1uU3DXMV4tSr-30BQQiedgnNHU5MnLYAZPP77X2qQ";
  Future getDevices() async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Authorization": key,
      "Accept": "application/json",
      "Content-type": "application/json"
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> body = jsonDecode(response.body);
      List<Device> device =
          body.map((dynamic item) => Device.fromJson(item)).toList();
      return device;
    } else {
      throw Exception('Failed to load device');
    }
  }

  Future createDevice(String ref) async {
    final msg = jsonEncode({
      'ref': ref,
    });
    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": key,
          "Accept": "application/json",
          "Content-type": "application/json"
        },
        body: msg);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future updateDevice(String idDevice, String ref) async {
    final msg = jsonEncode({
      'ref': ref,
    });
    final response = await http.put(Uri.parse(url + '/$idDevice'),
        headers: {
          "Authorization": key,
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: msg);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future deleteDevice(String idDevice) async {
    final response = await http.delete(Uri.parse(url + '/$idDevice'), headers: {
      "Authorization": key,
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print(response.statusCode);
    if (response.statusCode == 204) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
