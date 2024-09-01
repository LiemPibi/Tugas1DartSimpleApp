void main() {
  var expenses = [];

  while (true) {
    print('Aplikasi Keuangan Sederhana');
    print('1. Tambah Pengeluaran');
    print('2. Lihat Pengeluaran');
    print('3. Lihat Total Pengeluaran');
    print('4. Keluar');

    // Hardcoded input values
    var input = '1';

    switch (input) {
      case '1':
        var amountStr = '1000';
        double amount = double.parse(amountStr);
        var category = 'Food';
        var note = '';
        expenses.add({'amount': amount, 'category': category, 'note': note.isEmpty ? null : note, 'date': DateTime.now()});
        break;
      case '2':
        print('Pengeluaran:');
        expenses.forEach((expense) {
          print('Rp ${expense['amount']} - ${expense['category']} - ${expense['date']}');
          if (expense['note'] != null) {
            print('Catatan: ${expense['note']}');
          }
        });
        break;
      case '3':
        var startDateStr = '2022-01-01';
        DateTime startDate = DateTime.parse(startDateStr);
        var endDateStr = '2022-01-31';
        DateTime endDate = DateTime.parse(endDateStr);
        double totalExpenses = expenses
            .where((expense) => expense['date'].isAfter(startDate) && expense['date'].isBefore(endDate))
            .fold(0, (sum, expense) => sum + expense['amount']);
        print('Total pengeluaran: Rp $totalExpenses');
        break;
      case '4':
        print('Keluar dari aplikasi');
        return;
      default:
        print('Menu tidak valid');
    }
  }
}
