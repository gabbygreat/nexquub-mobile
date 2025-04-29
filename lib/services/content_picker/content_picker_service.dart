import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

abstract class ContentPickerService {
  int? maxFileSize; // Maximum file size in bytes (optional)

  /// Pick a single file.
  Future<SelectedFile?> pickSingleFile({List<String>? allowedExtensions});

  /// Pick multiple files.
  Future<List<SelectedFile>?> pickMultipleFiles(
      {List<String>? allowedExtensions});

  /// Pick a directory (if supported by the implementation).
  Future<String?> pickDirectory();

  /// Pick a file and get its byte content.
  Future<PickedFileWithContent?> pickFileWithContent(
      {List<String>? allowedExtensions});

  /// Pick an image from gallery or camera.
  Future<SelectedFile?> pickImage({ImageSource source = ImageSource.gallery});

  Future<String> readTxt(File file);

  Future<String> readPDF(File file);

  Future<String> readDoc(File file);
}

/// Class to represent a picked file.
class SelectedFile {
  final String path;
  final String name;

  SelectedFile({
    required this.path,
    required this.name,
  });

  File get file => File(path);
}

/// Class to represent a picked file with its content.
class PickedFileWithContent extends SelectedFile {
  final Uint8List content;

  PickedFileWithContent({
    required super.path,
    required super.name,
    required this.content,
  });
}
