import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // Database instance
  static Database? _database;

  // Table names
  static const String tableIncome = 'income';
  static const String tableExpenses = 'expenses';
  static const String tableBudget = 'budget';
  static const String tableReminders = 'reminders';
  static const String tableGoals = 'goals';
  static const String tableNotifications = 'notifications';
  static const String tableUser = 'user';

  // Get the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'expense_tracker.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create tables
  Future<void> _onCreate(Database db, int version) async {
    // Create income table
    await db.execute('''
      CREATE TABLE $tableIncome (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        date TEXT NOT NULL,
        category TEXT
      )
    ''');

    // Create expenses table
    await db.execute('''
      CREATE TABLE $tableExpenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        date TEXT NOT NULL,
        category TEXT NOT NULL,
        paymentMethod TEXT
      )
    ''');

    // Create budget table
    await db.execute('''
      CREATE TABLE $tableBudget (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT NOT NULL,
        amount REAL NOT NULL,
        startDate TEXT NOT NULL,
        endDate TEXT NOT NULL
      )
    ''');

    // Create reminders table
    await db.execute('''
      CREATE TABLE $tableReminders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        reminderDate TEXT NOT NULL,
        dueDate TEXT NOT NULL,
        price REAL NOT NULL
      )
    ''');

    // Create goals table
    await db.execute('''
      CREATE TABLE $tableGoals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        targetAmount REAL NOT NULL,
        savedAmount REAL NOT NULL DEFAULT 0,
        deadline TEXT NOT NULL
      )
    ''');

    // Create notifications table
    await db.execute('''
      CREATE TABLE $tableNotifications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        timestamp TEXT NOT NULL
      )
    ''');

        // Create user table
    await db.execute('''
      CREATE TABLE $tableUser (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        email TEXT NOT NULL,
        gender TEXT NOT NULL,
        age REAL NOT NULL
      )
    ''');
  }

  // **************** CRUD Operations ****************

  // ******** User ********
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(tableUser, user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query(tableUser, orderBy: 'id DESC');
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      tableUser,
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      tableUser,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

    // ******** Income ********
  Future<int> insertIncome(Map<String, dynamic> income) async {
    final db = await database;
    return await db.insert(tableIncome, income);
  }

  Future<List<Map<String, dynamic>>> getAllIncome() async {
    final db = await database;
    return await db.query(tableIncome, orderBy: 'date DESC');
  }

  Future<int> updateIncome(Map<String, dynamic> income) async {
    final db = await database;
    return await db.update(
      tableIncome,
      income,
      where: 'id = ?',
      whereArgs: [income['id']],
    );
  }

  Future<int> deleteIncome(int id) async {
    final db = await database;
    return await db.delete(
      tableIncome,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ******** Expenses ********
  Future<int> insertExpense(Map<String, dynamic> expense) async {
    final db = await database;
    return await db.insert(tableExpenses, expense);
  }

  Future<List<Map<String, dynamic>>> getAllExpenses({int? limit}) async {
    final db = await database;
    return await db.query(tableExpenses, limit: limit, orderBy: 'id DESC');
  }

  Future<int> updateExpense(Map<String, dynamic> expense) async {
    final db = await database;
    return await db.update(
      tableExpenses,
      expense,
      where: 'id = ?',
      whereArgs: [expense['id']],
    );
  }

  Future<double> getTotalExpenses() async {
    final db = await database;
    final result =
        await db.rawQuery('SELECT SUM(amount) as total FROM $tableExpenses');
    double total = result.first['total'] as double? ?? 0.0;
    return total;
  }

  Future<int> deleteExpense(int id) async {
    final db = await database;
    return await db.delete(
      tableExpenses,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ******** Budget ********
  Future<int> insertBudget(Map<String, dynamic> budget) async {
    final db = await database;
    return await db.insert(tableBudget, budget);
  }

  Future<List<Map<String, dynamic>>> getBudgets(int? limit) async {
    final db = await database;
    return await db.query(tableBudget, limit: limit, orderBy: 'startDate ASC');
  }

  Future<int> updateBudget(Map<String, dynamic> budget) async {
    final db = await database;
    return await db.update(
      tableBudget,
      budget,
      where: 'id = ?',
      whereArgs: [budget['id']],
    );
  }

  Future<int> deleteBudget(int id) async {
    final db = await database;
    return await db.delete(
      tableBudget,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ******** Reminders ********
  Future<int> insertReminder(Map<String, dynamic> reminder) async {
    final db = await database;
    return await db.insert(tableReminders, reminder);
  }

  Future<List<Map<String, dynamic>>> getReminders() async {
    final db = await database;
    return await db.query(tableReminders, orderBy: 'reminderDate ASC');
  }

  Future<int> deleteReminder(int id) async {
    final db = await database;
    return await db.delete(
      tableReminders,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ******** Goals ********
  Future<int> insertGoal(Map<String, dynamic> goal) async {
    final db = await database;
    return await db.insert(tableGoals, goal);
  }

  Future<List<Map<String, dynamic>>> getGoals({int? limit}) async {
    final db = await database;
    return await db.query(tableGoals, limit: limit, orderBy: 'id DESC');
  }

  Future<int> updateGoal(Map<String, dynamic> goal) async {
    final db = await database;
    return await db.update(
      tableGoals,
      goal,
      where: 'id = ?',
      whereArgs: [goal['id']],
    );
  }

  Future<int> deleteGoal(int id) async {
    final db = await database;
    return await db.delete(
      tableGoals,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ******** Notification ********
  Future<int> insertNotification(Map<String, dynamic> notification) async {
    final db = await database;
    return await db.insert(tableNotifications, notification);
  }

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    final db = await database;
    return await db.query(tableNotifications, orderBy: 'id DESC');
  }

  Future<int> updateNotification(Map<String, dynamic> notification) async {
    final db = await database;
    return await db.update(
      tableNotifications,
      notification,
      where: 'id = ?',
      whereArgs: [notification['id']],
    );
  }

  Future<int> deleteNotification(int id) async {
    final db = await database;
    return await db.delete(
      tableNotifications,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close the database
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
