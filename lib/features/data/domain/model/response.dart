class Response {
  String? image;
  String? title;
  String? body;
  DateTime? timestamp;

  Response({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      image: json['image'] ?? 'https://via.placeholder.com/150',
      title: json['title'],
      body: json['body'],
      timestamp: DateTime.tryParse(json['timestamp'] ?? ''),
    );
  }
}
