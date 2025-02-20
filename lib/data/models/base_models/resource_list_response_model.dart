class ResourceListResponseModel<T> {
  final int status;
  final String message;
  final List<T> data;

  ResourceListResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResourceListResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ResourceListResponseModel<T>(
      status: json['status'],
      message: json['message'],
      data: List<T>.from(json['data'].map((item) => fromJsonT(item))),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => toJsonT(item)).toList(),
    };
  }
}