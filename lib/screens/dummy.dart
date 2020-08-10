import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:pdf_render/pdf_render.dart';

class Dummy extends StatefulWidget {
  final PdfPageImage imageString;
  const Dummy({Key key, @required this.imageString}) : super(key: key);

  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getImage().then((value)=>doms=value);
      },
    );
  }

  getImage() async {
    var kz = await widget.imageString.imageIfAvailable.toByteData();
    return kz;
  }

  ByteData doms;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Image.memory(doms.buffer.asUint8List())),
    );
  }
}
