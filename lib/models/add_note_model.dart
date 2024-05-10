class AddNote {
  final String id;
  final String patientName;
  final String description;
  final String priority;

  AddNote({
    required this.id,
    required this.patientName,
    required this.description,
    required this.priority,
  });

  // Factory method to create AddNote instance from JSON
  factory AddNote.fromJson(Map<String, dynamic> json) {
    return AddNote(
      id: json['id'],
      patientName: json['patientName'],
      description: json['description'],
      priority: json['priority'],
    );
  }

  // Method to convert AddNote instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientName': patientName,
      'description': description,
      'priority': priority,
    };
  }
}
