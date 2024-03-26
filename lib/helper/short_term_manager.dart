
class ShortTermManager {
  static final ShortTermManager _shortTermManager =
      ShortTermManager._internal();

  String? language;
  String fbToken = "null";
  String? organizationName;
  String? dropDownValue;

  void clear() {
  }

  void setDropDownList(String? dropDownValue) {
    this.dropDownValue = dropDownValue;
  }
  String? getDropDownList() {
    return dropDownValue;
  }

  void setOrganizationName(String organizationName){
    this.organizationName = organizationName;
  }

  String? getOrganizationName(){
    return organizationName;
  }

  void setFbToken(String fbToken) {
    this.fbToken = fbToken;
  }
  String getFbToken() {
    return fbToken;
  }
  void setLanguage(String? language) {
    this.language = language;
  }

  String? getLanguage() {
    return language;
  }

  factory ShortTermManager() {
    return _shortTermManager;
  }

  ShortTermManager._internal();
}
