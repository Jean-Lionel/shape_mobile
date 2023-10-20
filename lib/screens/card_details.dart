import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CardDetails extends StatelessWidget {
  final dynamic invitation;
  const CardDetails(this.invitation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            title: Text("invitation de ${invitation.nomInvite}  "),
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
                        value: '${invitation.qrCodes}',
                        symbology: QRCode(),
                        showValue: false,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    "${invitation.nomInvite}",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).textTheme.titleSmall!.color,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "${invitation.mailInvite}, ${invitation.phoneNumber}",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "${invitation.nombreInvites} personnes",
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
