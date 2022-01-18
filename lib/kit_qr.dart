library kit_qr;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class KitQr extends StatefulWidget {
  const KitQr(
      {required this.data,
      this.size = 200,
      this.image,
      this.imageSize= 50,
      this.noiseColors,
      this.noiseRate = 0,
      Key? key})
      : super(key: key);

  final String data;
  final double size;
  final double imageSize;
  final ImageProvider? image;
  final List<Color>? noiseColors;
  final double noiseRate;

  @override
  _KitQrState createState() => _KitQrState(
        this.data,
        this.size,
        this.image,
        this.imageSize,
        this.noiseColors,
        this.noiseRate,
      );
}

class _KitQrState extends State<KitQr> {
  _KitQrState(
      this.data, this.size, this.image, this.imageSize, this.noiseColors, this.noiseRate)
      : assert((noiseColors == null || noiseColors.isEmpty) || (noiseRate > 0));

  final String data;
  final double size, imageSize;
  final ImageProvider? image;
  final List<Color>? noiseColors;
  final double noiseRate;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: size,
      gapless: false,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      padding: const EdgeInsets.all(0),
      dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: Colors.black,
          noiseColors: noiseColors,
          noiseRate: noiseRate),
      eyeStyle:
          const QrEyeStyle(eyeShape: QrEyeShape.dotted, color: Colors.black),
      embeddedImage: image,
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(imageSize,imageSize),
      ),
    );
  }
}
