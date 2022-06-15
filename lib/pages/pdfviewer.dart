import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfpreviewScreen extends StatelessWidget {
  final String path;

  PdfpreviewScreen({required this.path});
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
