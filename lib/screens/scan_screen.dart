import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shapp/screens/home.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Scanner invitation"),
            pinned: true,
          ),
          const SliverToBoxAdapter(child: SpendLess()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      scan();
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 150.0),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          size: 100,
                        )),
                  ),
                  Text(
                    data,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => data = value));
  }
}
