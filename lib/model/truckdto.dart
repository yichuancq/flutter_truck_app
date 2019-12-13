import 'dart:ffi';

class TruckDto {
  List<Rows> rows;
  int total;
  int page;
  int records;
  String costtime;

  TruckDto({this.rows, this.total, this.page, this.records, this.costtime});

  TruckDto.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    records = json['records'];
    costtime = json['costtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['records'] = this.records;
    data['costtime'] = this.costtime;
    return data;
  }
}

class Rows {
  int xH;
  String wJM;
  String cPH;
  String jCSJ;
  String dD;
  String dDN;
  String cD;
  String fX;
  String zS;
  String sD;
  int zZ;
  int cX;
  dynamic cXL;
//  double cXL;
  String cLBS;
  Null cLSJ;
  Null cLRY;
  Null cLDD;
  Null fMJE;
  String zXX;
  Null zKTQZT;
  Null zHBS;
  int scbz;
  String zxdm;
  Null lts;
  String xz;
  Null scry;
  Null cLRYBH;
  Null cLRYB;
  Null cLRYBBH;
  Null cLDSR;
  Null cLBZ;
  Null sms;
  String farPic;
  String farPicPlate;
  String farPicBack;
  String farPicBak;
  Null cFDW;
  int length;
  int width;
  int height;
  int up;
  Null gzh;

  Rows(
      {this.xH,
      this.wJM,
      this.cPH,
      this.jCSJ,
      this.dD,
      this.dDN,
      this.cD,
      this.fX,
      this.zS,
      this.sD,
      this.zZ,
      this.cX,
      this.cXL,
      this.cLBS,
      this.cLSJ,
      this.cLRY,
      this.cLDD,
      this.fMJE,
      this.zXX,
      this.zKTQZT,
      this.zHBS,
      this.scbz,
      this.zxdm,
      this.lts,
      this.xz,
      this.scry,
      this.cLRYBH,
      this.cLRYB,
      this.cLRYBBH,
      this.cLDSR,
      this.cLBZ,
      this.sms,
      this.farPic,
      this.farPicPlate,
      this.farPicBack,
      this.farPicBak,
      this.cFDW,
      this.length,
      this.width,
      this.height,
      this.up,
      this.gzh});

  Rows.fromJson(Map<String, dynamic> json) {
    xH = json['XH'];
    wJM = json['WJM'];
    cPH = json['CPH'];
    jCSJ = json['JCSJ'];
    dD = json['DD'];
    dDN = json['DDN'];
    cD = json['CD'];
    fX = json['FX'];
    zS = json['ZS'];
    sD = json['SD'];
    zZ = json['ZZ'];
    cX = json['CX'];
    //
    cXL = json['CXL'];
    cLBS = json['CLBS'];
    cLSJ = json['CLSJ'];
    cLRY = json['CLRY'];
    cLDD = json['CLDD'];
    fMJE = json['FMJE'];
    zXX = json['ZXX'];
    zKTQZT = json['ZKTQZT'];
    zHBS = json['ZHBS'];
    scbz = json['scbz'];
    zxdm = json['zxdm'];
    lts = json['lts'];
    xz = json['xz'];
    scry = json['scry'];
    cLRYBH = json['CLRYBH'];
    cLRYB = json['CLRYB'];
    cLRYBBH = json['CLRYBBH'];
    cLDSR = json['CLDSR'];
    cLBZ = json['CLBZ'];
    sms = json['Sms'];
    farPic = json['FarPic'];
    farPicPlate = json['FarPic_Plate'];
    farPicBack = json['FarPic_Back'];
    farPicBak = json['FarPic_Bak'];
    cFDW = json['CFDW'];
    length = json['Length'];
    width = json['Width'];
    height = json['Height'];
    up = json['up'];
    gzh = json['Gzh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['XH'] = this.xH;
    data['WJM'] = this.wJM;
    data['CPH'] = this.cPH;
    data['JCSJ'] = this.jCSJ;
    data['DD'] = this.dD;
    data['DDN'] = this.dDN;
    data['CD'] = this.cD;
    data['FX'] = this.fX;
    data['ZS'] = this.zS;
    data['SD'] = this.sD;
    data['ZZ'] = this.zZ;
    data['CX'] = this.cX;
    data['CXL'] = this.cXL;
    data['CLBS'] = this.cLBS;
    data['CLSJ'] = this.cLSJ;
    data['CLRY'] = this.cLRY;
    data['CLDD'] = this.cLDD;
    data['FMJE'] = this.fMJE;
    data['ZXX'] = this.zXX;
    data['ZKTQZT'] = this.zKTQZT;
    data['ZHBS'] = this.zHBS;
    data['scbz'] = this.scbz;
    data['zxdm'] = this.zxdm;
    data['lts'] = this.lts;
    data['xz'] = this.xz;
    data['scry'] = this.scry;
    data['CLRYBH'] = this.cLRYBH;
    data['CLRYB'] = this.cLRYB;
    data['CLRYBBH'] = this.cLRYBBH;
    data['CLDSR'] = this.cLDSR;
    data['CLBZ'] = this.cLBZ;
    data['Sms'] = this.sms;
    data['FarPic'] = this.farPic;
    data['FarPic_Plate'] = this.farPicPlate;
    data['FarPic_Back'] = this.farPicBack;
    data['FarPic_Bak'] = this.farPicBak;
    data['CFDW'] = this.cFDW;
    data['Length'] = this.length;
    data['Width'] = this.width;
    data['Height'] = this.height;
    data['up'] = this.up;
    data['Gzh'] = this.gzh;
    return data;
  }
}
