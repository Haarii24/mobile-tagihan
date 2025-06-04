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
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(), // Tambahkan drawer jika diperlukan
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text(
          "SISTEM INFORMASI POLIBAN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            width: double.infinity,
            color: Colors.indigo,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              "ADMIN KEUANGAN",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transaksi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.account_balance_wallet, size: 18),
                    SizedBox(width: 8),
                    Text("Transaksi > Tagihan"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              border: OutlineInputBorder(),
                            ),
                            value: null,
                            hint: const Text("--Semua--"),
                            items: const [
                              DropdownMenuItem(value: null, child: Text("--Semua--")),
                              // Tambahkan item lain jika perlu
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          icon: const Icon(Icons.refresh, color: Colors.white),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(8),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(""),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: "10 Baris",
                          items: const [
                            DropdownMenuItem(value: "10 Baris", child: Text("10 Baris")),
                            DropdownMenuItem(value: "20 Baris", child: Text("20 Baris")),
                          ],
                          onChanged: (value) {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "$currentPage",
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}