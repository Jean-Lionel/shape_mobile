import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: true,
            title: Text("Détails de l'invitation"),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: SfBarcodeGenerator(
                        value: 'NXNF8_aetz',
                        symbology: QRCode(),
                        showValue: false,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Famille Bagule Nestor",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).textTheme.titleSmall!.color,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "nestorbagula@gmail.com, +243 68 732 687 973",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "2 personnes",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("Partager"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
