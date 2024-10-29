class ApiRequest {
  final String endpoint;
  final bool useToken;
  final Map<String, dynamic> body;
  final Map<String, String>? queryParams;
  final String method;

  ApiRequest.get(
    this.endpoint, {
    this.queryParams,
    this.useToken = true,
  })  : body = const {},
        method = 'GET';

  ApiRequest.post(
    this.endpoint,
    this.body, {
    this.queryParams,
    this.useToken = true,
  }) : method = 'POST';

  ApiRequest.patch(
    this.endpoint,
    this.body, {
    this.queryParams,
    this.useToken = true,
  }) : method = 'PATCH';

  ApiRequest.put(
    this.endpoint,
    this.body, {
    this.queryParams,
    this.useToken = true,
  }) : method = 'PUT';

  ApiRequest.delete(
    this.endpoint,
    this.body, {
    this.queryParams,
    this.useToken = true,
  }) : method = 'DELETE';

  @override
  bool operator ==(other) =>
      other is ApiRequest &&
      endpoint == other.endpoint &&
      method == other.method;

  @override
  int get hashCode => endpoint.hashCode;
}
