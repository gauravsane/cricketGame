class UserData {
  final String userType;
  final String ObjuserId;
  final String userName;
  final String BusinessUnit;
  final String Role;
  final String Name;
  final String HQ;
  final String Region;
  final String Zone;

  UserData({
    required this.userType,
    required this.ObjuserId,
    required this.userName,
    required this.BusinessUnit,
    required this.Role,
    required this.Name,
    required this.HQ,
    required this.Region,
    required this.Zone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userType: json['userType'] ?? '',
      ObjuserId: json['ObjuserId'] ?? '',
      userName: json['userName'] ?? '',
      BusinessUnit: json['BusinessUnit'] ?? '',
      Role: json['Role'] ?? '',
      Name: json['Name'] ?? '',
      HQ: json['HQ'] ?? '',
      Region: json['Region'] ?? '',
      Zone: json['Zone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userType': userType,
      'ObjuserId': ObjuserId,
      'userName': userName,
      'BusinessUnit': BusinessUnit,
      'Role': Role,
      'Name': Name,
      'HQ': HQ,
      'Region': Region,
      'Zone': Zone,
    };
  }
}
