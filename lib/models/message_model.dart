class MessageModel {
  String? message;
  String? date;
  String? senderId;
  String? recieverId;
  MessageModel.fromJson({required Map<String, dynamic> json}) {
    message = json['message'];
    date = json['date'];
    senderId = json['senderId'];
    recieverId = json['recieverId'];
  }
  static Map<String, dynamic> toMap({required MessageModel message}) {
    return {
      "message": message.message,
      "date": message.date,
      "senderId": message.senderId,
      "recieverId": message.recieverId,
    };
  }

  MessageModel({
    required this.message,
    required this.date,
    required this.senderId,
    required this.recieverId,
  });
}
