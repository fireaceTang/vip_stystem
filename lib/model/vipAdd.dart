class VipAdd<T> {
  String vipName;
  int labelId;
  String avatar;
  String content;
  int uuid;
  String telephone;
  int unitId;
  int userId;

  VipAdd({this.vipName, this.labelId, this.avatar, this.content, this.uuid, this.telephone, this.unitId, this.userId});

  Map<String, dynamic> toJson() => {
    'vipName': vipName,
    'labelId': labelId,
    'avatar': avatar,
    'content': content,
    'uuid': uuid,
    'telephone': telephone,
    'unitId': unitId,
    'userId': userId,
  };

}