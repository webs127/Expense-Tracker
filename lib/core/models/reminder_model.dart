class ReminderModel{
  final int? id;
  final String name;
  final String reminderDate;
  final String dueDate;
  final double price;

  ReminderModel(
      {this.id,
      required this.name,
      required this.reminderDate,
      required this.dueDate,
      required this.price});

  ReminderModel copyWith({
    int? id,
    String? name,
    String? reminderDate,
    String? dueDate,
    double? price,
  }) =>
      ReminderModel(
          id: id ?? this.id,
          name: name ?? this.name,
          reminderDate: reminderDate ?? this.reminderDate,
          dueDate: dueDate ?? this.dueDate,
          price: price ?? this.price);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': name,
        'reminderDate': reminderDate,
        'dueDate': dueDate,
        'price': price
      };

  factory ReminderModel.fromJson(Map<String, dynamic> data) => ReminderModel(
      id: data['id'],
      name: data['title'],
      reminderDate: data['reminderDate'],
      dueDate: data['dueDate'],
      price: data['price']);
}
