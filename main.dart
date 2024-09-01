void main() {
  var expenses = [];

  while (true) {
    print('Simple Finance App');
    print('1. Add Expense');
    print('2. View Expenses');
    print('3. View Total Expenses');
    print('4. Exit');

    var input = '1'; // hardcoded input for now

    switch (input) {
      case '1':
        var amount = 1000;
        var category = 'Food';
        expenses.add({'amount': amount, 'category': category, 'date': DateTime.now()});
        break;
      case '2':
        print('Expenses:');
        expenses.forEach((expense) {
          print('Rp ${expense['amount']} - ${expense['category']} - ${expense['date']}');
        });
        break;
      case '3':
        var totalExpenses = expenses.fold(0, (sum, expense) => sum + expense['amount']);
        print('Total expenses: Rp $totalExpenses');
        break;
      case '4':
        print('Exiting app');
        return;
      default:
        print('Invalid menu');
    }
  }
}
