class GoalModel {
  final int? id;
  final String title;
  final double savedAmount;
  final double targetAmount;
  final String type;
  final String deadline;

  GoalModel(
      {this.id,
      required this.title,
      required this.savedAmount,
      required this.targetAmount,
      required this.type,
      required this.deadline});

  GoalModel copyWith(
          {int? id,
          String? title,
          double? savedAmount,
          double? targetAmount,
          String? type,
          String? deadline}) =>
      GoalModel(
          id: id ?? this.id,
          title: title ?? this.title,
          savedAmount: savedAmount ?? this.savedAmount,
          targetAmount: targetAmount ?? this.targetAmount,
          type: type ?? this.type,
          deadline: deadline ?? this.deadline);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'savedAmount': savedAmount,
        'targetAmount': targetAmount,
        'type': type,
        'deadline': deadline
      };

  factory GoalModel.fromJson(Map<String, dynamic> data) => GoalModel(
      id: data['id'],
      title: data['title'],
      savedAmount: data['savedAmount'],
      targetAmount: data['targetAmount'],
      type: data['type'],
      deadline: data['deadline']);

  @override
  String toString() {
    return """{id: $id,
title: $title,
savedAmount: $savedAmount,
targetAmount: $targetAmount,
type: $type,
deadline: $deadline}
""";
  }
}
