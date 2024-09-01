void main() {
  List<Map<String, dynamic>> expenses = [];

  while (true) {
    print("Simple Finance App");
    print("1. Add Expense");
    print("2. View Expenses");
    print("3. View Total Expenses");
    print("4. Exit App");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addExpense(expenses);
        break;
      case 2:
        viewExpenses(expenses);
        break;
      case 3:
        viewTotalExpenses(expenses);
        break;
      case 4:
        print("Exiting app.");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

void addExpense(List<Map<String, dynamic>> expenses) {
  print("Enter amount:");
  double amount = double.parse(stdin.readLineSync()!);

  print("Enter category:");
  String category = stdin.readLineSync()!;

  print("Enter date (yyyy-mm-dd):");
  String date = stdin.readLineSync()!;

  Map<String, dynamic> expense = {
    "amount": amount,
    "category": category,
    "date": date,
  };

  expenses.add(expense);
  print("Expense added successfully!");
}

void viewExpenses(List<Map<String, dynamic>> expenses) {
  print("Expenses:");
  for (Map<String, dynamic> expense in expenses) {
    print("  Amount: ${expense["amount"]}");
    print("  Category: ${expense["category"]}");
    print("  Date: ${expense["date"]}");
    print();
  }
}

void viewTotalExpenses(List<Map<String, dynamic>> expenses) {
  double totalAmount = expenses.fold(0, (sum, expense) => sum + expense["amount"]);
  print("Total expenses: $totalAmount");
}
