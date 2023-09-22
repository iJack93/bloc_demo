class Todo {

  String? id;
  String? content;
  bool? done;
  String? createdAt;
  String? updatedAt;

  Todo({
    this.id,
    this.content,
    this.done,
    this.createdAt,
    this.updatedAt,
  });

  Todo.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    done = json['done'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['done'] = done;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  Todo copyWith({
    String? id,
    String? content,
    bool? done,
    String? createdAt,
    String? updatedAt,
  }) => Todo(
    id: id ?? this.id,
    content: content ?? this.content,
    done: done ?? this.done,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

}