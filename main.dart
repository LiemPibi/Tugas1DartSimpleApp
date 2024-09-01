import 'package:flutter/material.dart';

// Fungsi utama yang menjalankan aplikasi
void main() {
  runApp(MyApp());
}

// Widget aplikasi utama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Keuangan Sederhana', // judul aplikasi
      home: MyHomePage(), // halaman utama aplikasi
    );
  }
}

// Widget halaman utama
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// State halaman utama
class _MyHomePageState extends State<MyHomePage> {
  // Kontroler teks untuk input fields
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();

  // Daftar pengeluaran
  List<Map<String, dynamic>> expenses = [];

  // Fungsi yang dipanggil ketika tombol "Tambah Pengeluaran" ditekan
  void _addExpense() {
    // Dapatkan nilai input dari input fields
    double amount = double.parse(_amountController.text);
    String category = _categoryController.text;
    String date = _dateController.text;

    // Buat map pengeluaran baru
    Map<String, dynamic> expense = {
      "amount": amount,
      "category": category,
      "date": date,
    };

    // Tambahkan pengeluaran ke daftar
    setState(() {
      expenses.add(expense);
    });

    // Bersihkan input fields
    _amountController.clear();
    _categoryController.clear();
    _dateController.clear();

    print("Pengeluaran berhasil ditambahkan!");
  }

  // Fungsi yang dipanggil ketika tombol "Lihat Pengeluaran" ditekan
  void _viewExpenses() {
    print("Pengeluaran:");
    for (Map<String, dynamic> expense in expenses) {
      print("  Jumlah: ${expense["amount"]}");
      print("  Kategori: ${expense["category"]}");
      print("  Tanggal: ${expense["date"]}");
      print();
    }
  }

  // Fungsi yang dipanggil ketika tombol "Lihat Total Pengeluaran" ditekan
  void _viewTotalExpenses() {
    double totalAmount = expenses.fold(0, (sum, expense) => sum + expense["amount"]);
    print("Total pengeluaran: $totalAmount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Keuangan Sederhana'), // judul aplikasi
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // tambahkan padding sekitar konten
        child: Column(
          children: [
            // Input fields untuk jumlah, kategori, dan tanggal
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Masukkan jumlah'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Masukkan kategori'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Masukkan tanggal (yyyy-mm-dd)'),
            ),
            // Tombol untuk menambah, melihat, dan menghitung pengeluaran
            ElevatedButton(
              onPressed: _addExpense,
              child: Text('Tambah Pengeluaran'),
            ),
            ElevatedButton(
              onPressed: _viewExpenses,
              child: Text('Lihat Pengeluaran'),
            ),
            ElevatedButton(
              onPressed: _viewTotalExpenses,
              child: Text('Lihat Total Pengeluaran'),
            ),
            SizedBox(height: 20), // tambahkan ruang antara tombol dan daftar
            Text(
              'Pengeluaran:',
              style: TextStyle(fontSize: 18),
            ),
            // List view untuk menampilkan pengeluaran
            ListView.builder(
              shrinkWrap: true,
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> expense = expenses[index];
                return ListTile(
                  title: Text('Jumlah: ${expense["amount"]}'),
                  subtitle: Text('Kategori: ${expense["category"]}, Tanggal: ${expense["date"]}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
