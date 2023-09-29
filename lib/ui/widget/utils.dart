

//import 'dart:ffi';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source, int imageQuality) async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source, imageQuality: imageQuality);
  
  if(_file != null){
    return await _file.readAsBytes();
  }
print("Tidak ada gambar dipilih ");
}


// compress file and get Uint8List
  