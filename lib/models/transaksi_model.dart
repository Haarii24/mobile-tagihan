class Transaksi {
  String kodeTagihan;
  String nim;
  String jenisPembayaran;
  String periode;
  DateTime tanggal;
  double nominal;
  String status;

  Transaksi({
    required this.kodeTagihan,
    required this.nim,
    required this.jenisPembayaran,
    required this.periode,
    required this.tanggal,
    required this.nominal,
    required this.status,
  });
}
