class PayloadModel {
  String timestamp;
  int status;
  Object error;
  String message;
  Object data;

  PayloadModel(
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.data,
  );
}
