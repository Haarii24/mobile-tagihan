import 'package:flutter/material.dart';
import '../models/transaksi_model.dart';

class TransaksiCard extends StatelessWidget {
  final Transaksi transaksi;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TransaksiCard({
    super.key,
    required this.transaksi,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text("Kode: ${transaksi.kodeTagihan}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NIM: ${transaksi.nim}"),
            Text("Pembayaran: ${transaksi.jenisPembayaran}"),
            Text("Periode: ${transaksi.periode}"),
            Text("Tanggal: ${transaksi.tanggal.toLocal()}".split(" ")[0]),
            Text("Nominal: ${transaksi.nominal.toStringAsFixed(0)}"),
            Text("Status: ${transaksi.status}"),
          ],
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.orange),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
