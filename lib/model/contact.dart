
class Contact {
  String? name;
  String? phone;

  Contact({this.name, this.phone});

  Contact.fromJson(json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }

  toMap() => {
      "name": name,
      "phone": phone
    };
}