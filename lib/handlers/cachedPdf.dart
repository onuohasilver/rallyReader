import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';

Future<String> generateImage(fileName) async {
  /// Open the document using either openFile, openAsset, or openData.
  PdfDocument doc = await PdfDocument.openFile(fileName);

// The first page is 1
  PdfPage page = await doc.getPage(1);

// For the render function's return, see explanation below
  PdfPageImage pageImage = await page.render();

// Now, you can access pageImage.pixels for raw RGBA data
// ...

// Generating dart:ui.Image cache for later use by imageIfAvailable
  await pageImage.createImageIfNotAvailable();

  ByteData imageBytes = await pageImage.imageIfAvailable.toByteData();
  List<int> imageList = imageBytes.buffer.asUint8List();
  String base64Encode(List<int> bytes) => base64.encode(bytes);
  Uint8List base64Decode(String source) => base64.decode(source);
  String img64 = base64Encode(imageList);
  final decodedBytes = base64Decode(img64);

  Directory directory = await getTemporaryDirectory();
  String pathX = join(directory.path, "image.png");
  var file = File(pathX);
  await file.writeAsBytes(decodedBytes);
  print(decodedBytes.toString());

// PDFDocument must be disposed as soon as possible.
  doc.dispose();

  return pathX;
}

Future<String> generateImageDummy(fileName) async {
  /// Open the document using either openFile, openAsset, or openData.
  PdfDocument doc = await PdfDocument.openFile(fileName);

// The first page is 1
  PdfPage page = await doc.getPage(1);

// For the render function's return, see explanation below
  PdfPageImage pageImage = await page.render();

// Now, you can access pageImage.pixels for raw RGBA data
// ...

// Generating dart:ui.Image cache for later use by imageIfAvailable
  await pageImage.createImageIfNotAvailable();

  ByteData imageBytes = await pageImage.imageIfAvailable.toByteData();
  List<int> imageList = imageBytes.buffer.asUint8List();
  String base64Encode(List<int> bytes) => base64.encode(bytes);
  Uint8List base64Decode(String source) => base64.decode(source);
  String img64 = base64Encode(imageList);
  final decodedBytes = base64Decode(img64);

  Directory directory = await getTemporaryDirectory();
  String pathX = join(directory.path, "image.png");
  var file = File(pathX);
  await file.writeAsBytes(decodedBytes);
  print(decodedBytes.toString());

// PDFDocument must be disposed as soon as possible.
  doc.dispose();

  return img64;
}

Future<PdfPageImage> getImageFile(String fileName, path) async {
  /// Open the document using either openFile, openAsset, or openData.
  PdfDocument doc = await PdfDocument.openFile(fileName);

// The first page is 1
  PdfPage page = await doc.getPage(1);

// For the render function's return, see explanation below
  PdfPageImage pageImage = await page.render();

// Now, you can access pageImage.pixels for raw RGBA data
// ...

// Generating dart:ui.Image cache for later use by imageIfAvailable
  await pageImage.createImageIfNotAvailable();
  print(pageImage.pixels);
  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(pageImage.pixels.buffer.asUint8List(
      pageImage.pixels.offsetInBytes, pageImage.pixels.lengthInBytes));

  return pageImage;
}
