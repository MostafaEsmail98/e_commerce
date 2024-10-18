class CheckoutModel {
  CheckoutModel({
    this.status,
    this.session,
  });

  CheckoutModel.fromJson(dynamic json) {
    status = json['status'];
    session =
        json['session'] != null ? Session.fromJson(json['session']) : null;
  }

  String? status;
  Session? session;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (session != null) {
      map['session'] = session?.toJson();
    }
    return map;
  }
}

class Session {
  Session({
    this.url,
    this.successUrl,
    this.cancelUrl,
  });

  Session.fromJson(dynamic json) {
    url = json['url'];
    successUrl = json['success_url'];
    cancelUrl = json['cancel_url'];
  }

  String? url;
  String? successUrl;
  String? cancelUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['success_url'] = successUrl;
    map['cancel_url'] = cancelUrl;
    return map;
  }
}
