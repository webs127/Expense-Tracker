class NotificationModel {
  final int? id;
  final String title;
  final String type;
  final String timestamp;

  NotificationModel(
      {this.id,
      required this.title,
      required this.type,
      required this.timestamp});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'timestamp': timestamp,
      };

  NotificationModel copyWith({
    int? id,
    String? title,
    double? amount,
    String? type,
    String? timestamp,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> data) =>
      NotificationModel(
          id: data['id'],
          title: data['title'],
          type: data['type'],
          timestamp: data['timestamp']);

  @override
  String toString() {
    return """{id: $id,
title: $title,
type: $type,
timestamp: $timestamp,}
""";
  }
}
