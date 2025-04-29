import 'dart:io';

import 'package:docx_to_text/docx_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdf_text/flutter_pdf_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nexquub/utils/utils.dart';

class FilePickerServiceImpl implements ContentPickerService {
  @override
  int? maxFileSize; // Maximum file size in bytes (optional)

  FilePickerServiceImpl({this.maxFileSize});

  Future<String?> _cropImage(String path) async {
    return path;
    // CroppedFile? croppedFile = await ImageCropper().cropImage(
    //   sourcePath: path,
    //   uiSettings: [
    //     AndroidUiSettings(
    //       toolbarTitle: 'Crop Image',
    //       toolbarColor: PakeColors.primary,
    //       toolbarWidgetColor: PakeColors.darkBlue,
    //       initAspectRatio: CropAspectRatioPreset.original,
    //       lockAspectRatio: false,
    //     ),
    //     IOSUiSettings(
    //       title: 'Crop Image',
    //     ),
    //   ],
    // );
    // return croppedFile?.path;
  }

  @override
  Future<SelectedFile?> pickImage(
      {ImageSource source = ImageSource.gallery}) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: source,
    );

    if (image != null) {
      // Validate file sizes and filter out files exceeding the limit
      if (maxFileSize != null && File(image.path).lengthSync() > maxFileSize!) {
        throw CustomException(
          'File size exceeds the maximum allowed limit of ${maxFileSize! ~/ (1024 * 1024)} MB',
        );
      }
      final croppedImage = await _cropImage(image.path);
      if (croppedImage == null) {
        return null;
      }
      return SelectedFile(path: croppedImage, name: image.name);
    }
    return null;
  }

  @override
  Future<SelectedFile?> pickSingleFile(
      {List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions == null ? FileType.any : FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      final file = result.files.single;

      // Validate file size
      if (maxFileSize != null && file.size > maxFileSize!) {
        throw CustomException(
          'File size exceeds the maximum allowed limit of ${maxFileSize! ~/ (1024 * 1024)} MB',
        );
      }
      return SelectedFile(path: file.path!, name: file.name);
    }
    return null;
  }

  @override
  Future<List<SelectedFile>?> pickMultipleFiles(
      {List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions == null ? FileType.any : FileType.custom,
      allowedExtensions: allowedExtensions,
      allowMultiple: true,
    );

    if (result != null) {
      // Validate file sizes and filter out files exceeding the limit
      final validFiles = result.files
          .where((file) {
            if (maxFileSize != null && file.size > maxFileSize!) {
              throw CustomException(
                  'File size exceeds the maximum allowed limit of ${maxFileSize! ~/ (1024 * 1024)} MB');
            }
            return true;
          })
          .map((file) => SelectedFile(path: file.path!, name: file.name))
          .toList();

      return validFiles.isEmpty ? null : validFiles;
    }
    return null;
  }

  @override
  Future<String?> pickDirectory() async {
    return await FilePicker.platform.getDirectoryPath();
  }

  @override
  Future<PickedFileWithContent?> pickFileWithContent(
      {List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions == null ? FileType.any : FileType.custom,
      allowedExtensions: allowedExtensions,
      withData: true,
    );

    if (result != null && result.files.single.path != null) {
      final file = result.files.single;

      // Validate file size
      if (maxFileSize != null && file.size > maxFileSize!) {
        throw CustomException(
            'File size exceeds the maximum allowed limit of ${maxFileSize! ~/ (1024 * 1024)} MB');
      }

      return PickedFileWithContent(
        path: file.path!,
        name: file.name,
        content: file.bytes!,
      );
    }
    return null;
  }

  @override
  Future<String> readTxt(File file) async {
    String contents = await file.readAsString();
    return contents;
  }

  @override
  Future<String> readPDF(File file) async {
    return (await PDFDoc.fromFile(file)).text;
  }

  @override
  Future<String> readDoc(File file) async {
    final bytes = await file.readAsBytes();
    final text = docxToText(bytes);
    return text;
  }
}
