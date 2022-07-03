abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParams,
  });
  Future<dynamic> post(
    String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  );
  Future<dynamic> put(
    String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  );
}
