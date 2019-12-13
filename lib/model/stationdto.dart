/// 站点信息DTO
class StationDto {
  String moduleId;
  String parentId;
  String zDCode; // 站点code
  String zDName; // 站点名称
  String xLCode; // 线路code
  String xLName; // 线路名称
  Null icon;
  Null address;
  String target; //坐标 （116.630000,36.803002）
  Null isMenu;
  Null allowExpand;
  Null isPublic;
  Null allowEdit;
  Null allowDelete;
  int sortCode;
  int deleteMark;
  int enabledMark;
  Null description;
  String createDate;
  String createUserId;
  String createUserName;
  String modifyDate;
  String modifyUserId;
  String modifyUserName;

  StationDto(
      {this.moduleId,
      this.parentId,
      this.zDCode,
      this.zDName,
      this.xLCode,
      this.xLName,
      this.icon,
      this.address,
      this.target,
      this.isMenu,
      this.allowExpand,
      this.isPublic,
      this.allowEdit,
      this.allowDelete,
      this.sortCode,
      this.deleteMark,
      this.enabledMark,
      this.description,
      this.createDate,
      this.createUserId,
      this.createUserName,
      this.modifyDate,
      this.modifyUserId,
      this.modifyUserName});

  StationDto.fromJson(Map<String, dynamic> json) {
    moduleId = json['ModuleId'];
    parentId = json['ParentId'];
    zDCode = json['ZDCode'];
    zDName = json['ZDName'];
    xLCode = json['XLCode'];
    xLName = json['XLName'];
    icon = json['Icon'];
    address = json['Address'];
    target = json['Target'];
    isMenu = json['IsMenu'];
    allowExpand = json['AllowExpand'];
    isPublic = json['IsPublic'];
    allowEdit = json['AllowEdit'];
    allowDelete = json['AllowDelete'];
    sortCode = json['SortCode'];
    deleteMark = json['DeleteMark'];
    enabledMark = json['EnabledMark'];
    description = json['Description'];
    createDate = json['CreateDate'];
    createUserId = json['CreateUserId'];
    createUserName = json['CreateUserName'];
    modifyDate = json['ModifyDate'];
    modifyUserId = json['ModifyUserId'];
    modifyUserName = json['ModifyUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ModuleId'] = this.moduleId;
    data['ParentId'] = this.parentId;
    data['ZDCode'] = this.zDCode;
    data['ZDName'] = this.zDName;
    data['XLCode'] = this.xLCode;
    data['XLName'] = this.xLName;
    data['Icon'] = this.icon;
    data['Address'] = this.address;
    data['Target'] = this.target;
    data['IsMenu'] = this.isMenu;
    data['AllowExpand'] = this.allowExpand;
    data['IsPublic'] = this.isPublic;
    data['AllowEdit'] = this.allowEdit;
    data['AllowDelete'] = this.allowDelete;
    data['SortCode'] = this.sortCode;
    data['DeleteMark'] = this.deleteMark;
    data['EnabledMark'] = this.enabledMark;
    data['Description'] = this.description;
    data['CreateDate'] = this.createDate;
    data['CreateUserId'] = this.createUserId;
    data['CreateUserName'] = this.createUserName;
    data['ModifyDate'] = this.modifyDate;
    data['ModifyUserId'] = this.modifyUserId;
    data['ModifyUserName'] = this.modifyUserName;
    return data;
  }

}
