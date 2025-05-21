import 'package:flutter/material.dart';
import '../models/transaksi_model.dart';

class FormTagihan extends StatefulWidget {
  final Function(Transaksi) onSubmit;
  final Transaksi? transaksi;

  const FormTagihan({
    super.key,
    required this.onSubmit,
    this.transaksi,
  });


  @override
  State<FormTagihan> createState() => _FormTagihanState();
}

class _FormTagihanState extends State<FormTagihan> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _periodeController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _status = "Belum Lunas";
  @override
void initState() {
  super.initState();
  if (widget.transaksi != null) {
    _kodeController.text = widget.transaksi!.kodeTagihan;
    _nimController.text = widget.transaksi!.nim;
    _jenisController.text = widget.transaksi!.jenisPembayaran;
    _periodeController.text = widget.transaksi!.periode;
    _nominalController.text = widget.transaksi!.nominal.toString();
    _selectedDate = widget.transaksi!.tanggal;
    _status = widget.transaksi!.status;
  }
}


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final transaksi = Transaksi(
        kodeTagihan: _kodeController.text,
        nim: _nimController.text,
        jenisPembayaran: _jenisController.text,
        periode: _periodeController.text,
        tanggal: _selectedDate,
        nominal: double.tryParse(_nominalController.text) ?? 0,
        status: _status,
      );

      widget.onSubmit(transaksi);
      Navigator.pop(context);
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(widget.transaksi == null ? "Tambah Tagihan" : "Edit Tagihan"),
),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: const InputDecoration(labelText: "Kode Tagihan"),
                validator: (value) => value!.isEmpty ? "Harus diisi" : null,
              ),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) => value!.isEmpty ? "Harus diisi" : null,
              ),
              TextFormField(
                controller: _jenisController,
                decoration: const InputDecoration(labelText: "Jenis Pembayaran"),
              ),
              TextFormField(
                controller: _periodeController,
                decoration: const InputDecoration(labelText: "Periode"),
              ),
              TextFormField(
                controller: _nominalController,
                decoration: const InputDecoration(labelText: "Nominal"),
                keyboardType: TextInputType.number,
              ),
              ListTile(
                title: Text("Tanggal: ${_selectedDate.toLocal()}".split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              DropdownButtonFormField<String>(
                value: _status,
                items: const [
                  DropdownMenuItem(value: "Belum Lunas", child: Text("Belum Lunas")),
                  DropdownMenuItem(value: "Lunas", child: Text("Lunas")),
                ],
                onChanged: (value) => setState(() => _status = value!),
                decoration: const InputDecoration(labelText: "Status"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
  onPressed: _submitForm,
  child: Text(widget.transaksi == null ? "Simpan" : "Update"),
)
            ],
          ),
        ),
      ),
    );
  }
}
