import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shapp/config/routes/routes.dart';
import 'package:shapp/config/shared_preference/shared_preference_data.dart';

class ImageController {
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  PickedFile? pickedFile() => _pickedFile;

  String? _imagePath;
  String? imagePath() => _imagePath;

  Future<bool> pickImage(var iventId) async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    return await updateImage(_pickedFile, iventId);
  }

  Future<bool> updateImage(dynamic _pickedFile, var idIvent) async {
    http.MultipartRequest request = http.MultipartRequest(
        'POST', makeUrl('save/image/event/', params: idIvent));
    String token = UserSimplePeference.getToken();
    request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});

    if (_pickedFile != null) {
      File _file = File(_pickedFile.path);
      request.files.add(http.MultipartFile(
          'file', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path.split('/').last));
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
