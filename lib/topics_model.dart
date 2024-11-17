class SubscribedTopcis {
  final List<Topics> topics;

  SubscribedTopcis({
    required this.topics,
  });

  factory SubscribedTopcis.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> map = json["rel"]["topics"];

    return SubscribedTopcis(
      topics: (map.keys.map(
        (key) {
          return Topics(
              topic: key,
              addDate: DateTime.tryParse(map[key]?["addDate"] ?? ""));
        },
      ).toList()),
    );
  }

  @override
  String toString() => 'SubscribedTopcis(topics: $topics)';
}

class Topics {
  final String topic;
  final DateTime? addDate;
  Topics({
    required this.topic,
    required this.addDate,
  });

  Topics copyWith({
    String? topic,
    DateTime? addDate,
  }) {
    return Topics(
      topic: topic ?? this.topic,
      addDate: addDate ?? this.addDate,
    );
  }

  factory Topics.fromMap(Map<String, dynamic> map) {
    return Topics(
      topic: map['topic'] ?? '',
      addDate: DateTime.tryParse(map['addDate'] ?? ""),
    );
  }

  @override
  String toString() => 'Topics(topic: $topic, addDate: $addDate)';
}
