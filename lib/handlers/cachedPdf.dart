import 'package:pdf_render/pdf_render.dart';

Future<PdfPageImage> generateImage(fileName) async {
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

// PDFDocument must be disposed as soon as possible.
  doc.dispose();
  return pageImage;
}