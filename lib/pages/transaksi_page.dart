import 'package:flutter/material.dart';
import '../forms/form_tagihan.dart';
import '../models/transaksi_model.dart';
import '../widgets/transaksi_card.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final List<Transaksi> _daftarTagihan = [];

  void _addTagihan(Transaksi newTagihan) {
    setState(() {
      _daftarTagihan.add(newTagihan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaksi > Tagihan")),
      body: _daftarTagihan.isEmpty
          ? const Center(child: Text("Belum ada data tagihan."))
          : ListView.builder(
  itemCount: _daftarTagihan.length,
  itemBuilder: (context, index) {
    return TransaksiCard(
      transaksi: _daftarTagihan[index],
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormTagihan(
              transaksi: _daftarTagihan[index],
              onSubmit: (edited) {
                setState(() {
                  _daftarTagihan[index] = edited;
                });
              },
            ),
          ),
        );
      },
      onDelete: () {
        setState(() {
          _daftarTagihan.removeAt(index);
        });
      },
    );
  },
),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormTagihan(onSubmit: _addTagihan),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
