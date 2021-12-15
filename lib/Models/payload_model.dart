class PayloadModel {
  final String timestamp;
  final int status;
  final Object error;
  final String message;
  final Object data;

  PayloadModel(
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.data,
  );
}
