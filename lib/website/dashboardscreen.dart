import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DashboardScreen extends StatefulWidget {
  String? url;
  DashboardScreen({super.key, this.url});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Uint8List? _documentBytes;
  String? path;

  @override
  void initState() {
    getPdfBytes();
    super.initState();
  }

  void getPdfBytes() async {
    path = widget.url;
    if (kIsWeb) {
      firebase_storage.Reference pdfRef =
          firebase_storage.FirebaseStorage.instanceFor(
                  bucket: 'finalproject-29e57.appspot.com')
              .refFromURL(path!);
      //size mentioned here is max size to download from firebase.
      await pdfRef.getData(104857600).then((value) {
        _documentBytes = value;
        setState(() {});
      });
    } else {
      HttpClient client = HttpClient();
      final Uri url = Uri.base.resolve(path!);
      final HttpClientRequest request = await client.getUrl(url);
      final HttpClientResponse response = await request.close();
      _documentBytes = await consolidateHttpClientResponseBytes(response);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const Center(child: CircularProgressIndicator());
    if (_documentBytes != null) {
      // child = SfPdfViewer.memory(
      //   _documentBytes!,
      // );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter PDF Viewer')),
      body: child,
    );
  }
}
