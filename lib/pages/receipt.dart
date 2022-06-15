import 'dart:io';

import 'package:flutter/material.dart';
import 'package:last/pages/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'home_page.dart';

class Receipts extends StatefulWidget {
  const Receipts({Key? key}) : super(key: key);

  @override
  _ReceiptsState createState() => _ReceiptsState();
}

class _ReceiptsState extends State<Receipts> {
  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Text('Rising Cock Property Managers',
                    style: pw.TextStyle(fontSize: 20))),
            pw.Header(level: 1, child: pw.Text('Date: 26 Aug 2021')),
            pw.Paragraph(
                text: 'Confirmed that you have payed ........... ksh 10',
                style: pw.TextStyle(fontSize: 15)),
            pw.Paragraph(
                text:
                    'For Apartment ID .................................. 454eert',
                style: pw.TextStyle(fontSize: 15)),
            pw.Paragraph(
                text: 'You have been assigned to room ID .... 454ee89jrt',
                style: pw.TextStyle(fontSize: 15)),
            pw.Paragraph(
                text: 'For user ID: ddnye202',
                style: pw.TextStyle(fontSize: 15)),
            pw.Header(level: 1, child: pw.Text("The rising cock &#169"))
          ];
        }));
  }

  Future savepdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentpath = documentDirectory.path;

    File file = File("$documentpath/receipt.pdf");

    file.writeAsBytesSync(await pdf.save());
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
            title: Text('Payment receipts',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                )),
            centerTitle: true,
            toolbarHeight: 70,
            elevation: 70,
            backgroundColor: Colors.brown[400],
            actions: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ]),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Confirmed payment of amount:ksh10 \n for apartment ID 454eert room ID 454ee89jrt \n for user ID ddnye202')
                ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              writeOnPdf();
              await savepdf();
              Directory documentDirectory =
                  await getApplicationDocumentsDirectory();

              String documentpath = documentDirectory.path;

              String fullpath = "$documentpath/receipt.pdf";

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfpreviewScreen(
                            path: fullpath,
                          )));
            },
            child: Icon(Icons.receipt)),
      ),
    );
  }
}
