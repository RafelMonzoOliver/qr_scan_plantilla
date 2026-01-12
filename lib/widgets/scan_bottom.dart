import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async{
        print('Botó polsat!');
        
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#3D8BEF",
          "Cancelar",
          false,
          ScanMode.QR);
        print(barcodeScanRes);
        final scanListProveder = 
          Provider.of<ScanListProvider>(context, listen: false);
        //String barcodeScanRes = "geo: 39.7053737,3.102544";
        //String barcodeScanRes = "https://paucasesnovescifp.cat";
        //scanListProveder.nouScan(barcodeScanRes);
        ScanModel newScan = ScanModel(valor: barcodeScanRes);
        launchURL(context, newScan );

      },
    );
  }
}
