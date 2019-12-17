class TruckItemDto {
  Null zCDZ;
  Null yHMC;
  String year;
  String number;
  String cPH;
  String jCSJ;
  String dD;
  String zS;
  String zZ;
  String xZ;
  String cZ;
  String cXL; //超限率(%)
  String jCDH; // 检测单号
  String jDZSBH; //	检定证书编号
  String dDN;
  String xL; //线路
  Null cLLX;
  String sD; //速度(公里/小时)
  String jCSBBH; //检测设备编号
  String dW; //点位
  String fX;
  String plate;
  String cDH;
  String farPic;
  String farPicPlate; //图片
  String farPicBack; //图片
  String farPicBak; //图片
  Null cLRY;
  Null cLRYBH;
  Null cLRYB;
  Null cLRYBBH;

  TruckItemDto(
      {this.zCDZ,
      this.yHMC,
      this.year,
      this.number,
      this.cPH,
      this.jCSJ,
      this.dD,
      this.zS,
      this.zZ,
      this.xZ,
      this.cZ,
      this.cXL,
      this.jCDH,
      this.jDZSBH,
      this.dDN,
      this.xL,
      this.cLLX,
      this.sD,
      this.jCSBBH,
      this.dW,
      this.fX,
      this.plate,
      this.cDH,
      this.farPic,
      this.farPicPlate,
      this.farPicBack,
      this.farPicBak,
      this.cLRY,
      this.cLRYBH,
      this.cLRYB,
      this.cLRYBBH});

  TruckItemDto.fromJson(Map<String, dynamic> json) {
    zCDZ = json['ZCDZ'];
    yHMC = json['YHMC'];
    year = json['Year'];
    number = json['Number'];
    cPH = json['CPH'];
    jCSJ = json['JCSJ'];
    dD = json['DD'];
    zS = json['ZS'];
    zZ = json['ZZ'];
    xZ = json['XZ'];
    cZ = json['CZ'];
    cXL = json['CXL'];
    jCDH = json['JCDH'];
    jDZSBH = json['JDZSBH'];
    dDN = json['DDN'];
    xL = json['XL'];
    cLLX = json['CLLX'];
    sD = json['SD'];
    jCSBBH = json['JCSBBH'];
    dW = json['DW'];
    fX = json['FX'];
    plate = json['Plate'];
    cDH = json['CDH'];
    farPic = json['FarPic'];
    farPicPlate = json['FarPic_Plate'];
    farPicBack = json['FarPic_Back'];
    farPicBak = json['FarPic_Bak'];
    cLRY = json['CLRY'];
    cLRYBH = json['CLRYBH'];
    cLRYB = json['CLRYB'];
    cLRYBBH = json['CLRYBBH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ZCDZ'] = this.zCDZ;
    data['YHMC'] = this.yHMC;
    data['Year'] = this.year;
    data['Number'] = this.number;
    data['CPH'] = this.cPH;
    data['JCSJ'] = this.jCSJ;
    data['DD'] = this.dD;
    data['ZS'] = this.zS;
    data['ZZ'] = this.zZ;
    data['XZ'] = this.xZ;
    data['CZ'] = this.cZ;
    data['CXL'] = this.cXL;
    data['JCDH'] = this.jCDH;
    data['JDZSBH'] = this.jDZSBH;
    data['DDN'] = this.dDN;
    data['XL'] = this.xL;
    data['CLLX'] = this.cLLX;
    data['SD'] = this.sD;
    data['JCSBBH'] = this.jCSBBH;
    data['DW'] = this.dW;
    data['FX'] = this.fX;
    data['Plate'] = this.plate;
    data['CDH'] = this.cDH;
    data['FarPic'] = this.farPic;
    data['FarPic_Plate'] = this.farPicPlate;
    data['FarPic_Back'] = this.farPicBack;
    data['FarPic_Bak'] = this.farPicBak;
    data['CLRY'] = this.cLRY;
    data['CLRYBH'] = this.cLRYBH;
    data['CLRYB'] = this.cLRYB;
    data['CLRYBBH'] = this.cLRYBBH;
    return data;
  }
}
