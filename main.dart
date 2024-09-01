import 'package:flutter/material.dart';

// This is the main function that runs the app
void main() {
  runApp(MyApp());
}

// This is the main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Finance App', // title of the app
      home: MyHomePage(), // home page of the app
    );
  }
}

// This is the home page widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This is the state of the home page
class _MyHomePageState extends State<MyHomePage> {
  // These are the text controllers for the input fields
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();

  // This is the list of expenses
  List<Map<String, dynamic>> expenses = [];

  // This function is called when the "Add Expense" button is pressed
  void _addExpense() {
    // Get the input values from the text fields
    double amount = double.parse(_amountController.text);
    String category = _categoryController.text;
    String date = _dateController.text;

    // Create a new expense map
    Map<String, dynamic> expense = {
      "amount": amount,
      "category": category,
      "date": date,
    };

    // Add the expense to the list
    setState(() {
      expenses.add(expense);
    });

    // Clear the input fields
    _amountController.clear();
    _categoryController.clear();
    _dateController.clear();

    print("Expense added successfully!");
  }

  // This function is called when the "View Expenses" button is pressed
  void _viewExpenses() {
    print("Expenses:");
    for (Map<String, dynamic> expense in expenses) {
      print("  Amount: ${expense["amount"]}");
      print("  Category: ${expense["category"]}");
      print("  Date: ${expense["date"]}");
      print();
    }
  }

  // This function is called when the "View Total Expenses" button is pressed
  void _viewTotalExpenses() {
    double totalAmount = expenses.fold(0, (sum, expense) => sum + expense["amount"]);
    print("Total expenses: $totalAmount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Finance App'), // title of the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // add some padding around the content
        child: Column(
          children: [
            // Input fields for amount, category, and date
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Enter amount'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Enter category'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Enter date (yyyy-mm-dd)'),
            ),
            // Buttons for adding, viewing, and totaling expenses
            ElevatedButton(
              onPressed: _addExpense,
              child: Text('Add Expense'),
            ),
            ElevatedButton(
              onPressed: _viewExpenses,
              child: Text('View Expenses'),
            ),
            ElevatedButton(
              onPressed: _viewTotalExpenses,
              child: Text('View Total Expenses'),
            ),
            SizedBox(height: 20), // add some space between the buttons and the list
            Text(
              'Expenses:',
              style: TextStyle(fontSize: 18),
            ),
            // List view to display the expenses
            ListView.builder(
              shrinkWrap: true,
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> expense = expenses[index];
                return ListTile(
                  title: Text('Amount: ${expense["amount"]}'),
                  subtitle: Text('Category: ${expense["category"]}, Date: ${expense["date"]}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
