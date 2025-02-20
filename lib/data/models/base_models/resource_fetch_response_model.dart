// class ResourceFetchResponseModel<T> {
//   final int status;
//   final String message;
//   final T data;

//   ResourceFetchResponseModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   factory ResourceFetchResponseModel.fromJson(
//     Map<String, dynamic> json,
//     T Function(Map<String, dynamic>) fromJsonT,
//   ) {
//     return ResourceFetchResponseModel<T>(
//       status: json['status'],
//       message: json['message'],
//       data: fromJsonT(json['data']),
//     );
//   }

//   Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
//     return {
//       'status': status,
//       'message': message,
//       'data': toJsonT(data),
//     };
//   }
// }


class ResourceFetchResponseModel<T> {
  final int status;
  final String message;
  final T? data;

  ResourceFetchResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory ResourceFetchResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return ResourceFetchResponseModel<T>(
      status: json['status'] ?? 400,
      message: json['message'] ?? 'Unknown error',
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data']) 
          : null, // Handle cases where 'data' is null
    );
  }
}
