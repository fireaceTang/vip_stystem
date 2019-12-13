class ResponseModel<T> {
  T data;
  String msg;
  int code;

  ResponseModel({this.data, this.msg, this.code});

  ResponseModel.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        msg = json['msg'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'data': data,
        'msg': msg,
        'code': code,
      };
}
