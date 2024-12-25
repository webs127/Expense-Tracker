class ExpenseModel {
  final int? id;
  final String name;
  final String category;
  final double amount;
  final String date;
  final String paymentMethod;

  ExpenseModel(
      {this.id,
      required this.name,
      required this.category,
      required this.amount,
      required this.date,
      required this.paymentMethod});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'amount': amount,
        'date': date,
        'paymentMethod': paymentMethod
      };

  ExpenseModel copyWith(
          {int? id,
          String? name,
          double? amount,
          String? category,
          String? date,
          String? paymentMethod}) =>
      ExpenseModel(
          id: id ?? this.id,
          name: name ?? this.name,
          category: category ?? this.category,
          amount: amount ?? this.amount,
          date: date ?? this.date,
          paymentMethod: paymentMethod ?? this.paymentMethod);

  factory ExpenseModel.fromJson(Map<String, dynamic> data) => ExpenseModel(
      id: data['id'],
      name: data['name'],
      category: data['category'],
      amount: data['amount'],
      date: data['date'],
      paymentMethod: data['paymentMethod']);

  @override
  String toString() {
    return """{id: $id,
name: $name,
category: $category,
amount: $amount,
date: $date,
paymentMethod: $paymentMethod}
""";
  }
}
