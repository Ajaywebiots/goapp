import 'package:goapp/config.dart';

import 'currency_model.dart';

class AppSettingModel {
  General? general;
  Activation? activation;
  ProviderCommissions? providerCommissions;
  List<PaymentMethods>? paymentMethods;

  AppSettingModel(
      {this.general,
      this.activation,
      this.providerCommissions,
      this.paymentMethods});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    general =
        json['general'] != null ? General.fromJson(json['general']) : null;
    activation = json['activation'] != null
        ? Activation.fromJson(json['activation'])
        : null;
    providerCommissions = json['provider_commissions'] != null
        ? ProviderCommissions.fromJson(json['provider_commissions'])
        : null;
    if (json['payment_methods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['payment_methods'].forEach((v) {
        paymentMethods!.add(PaymentMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (general != null) {
      data['general'] = general!.toJson();
    }
    if (activation != null) {
      data['activation'] = activation!.toJson();
    }
    if (providerCommissions != null) {
      data['provider_commissions'] = providerCommissions!.toJson();
    }
    if (paymentMethods != null) {
      data['payment_methods'] = paymentMethods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class General {
  String? mode;
  String? favicon;
  String? copyright;
  String? darkLogo;
  String? lightLogo;
  String? defaultLanguage;
  String? defaultTimezone;
  int? minBookingAmount;
  int? defaultCurrencyId;
  CurrencyModel? defaultCurrency;

  General(
      {this.mode,
      this.favicon,
      this.copyright,
      this.darkLogo,
      this.lightLogo,
      this.defaultLanguage,
      this.defaultTimezone,
      this.minBookingAmount,
      this.defaultCurrencyId,
      this.defaultCurrency});

  General.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    favicon = json['favicon'];
    copyright = json['copyright'];
    darkLogo = json['dark_logo'];
    lightLogo = json['light_logo'];
    defaultLanguage = json['default_language'];
    defaultTimezone = json['default_timezone'];
    minBookingAmount = json['min_booking_amount'];
    defaultCurrencyId = json['default_currency_id'];
    defaultCurrency = json['default_currency'] != null
        ? CurrencyModel.fromJson(json['default_currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mode'] = mode;
    data['favicon'] = favicon;
    data['copyright'] = copyright;
    data['dark_logo'] = darkLogo;
    data['light_logo'] = lightLogo;
    data['default_language'] = defaultLanguage;
    data['default_timezone'] = defaultTimezone;
    data['min_booking_amount'] = minBookingAmount;
    data['default_currency_id'] = defaultCurrencyId;
    if (defaultCurrency != null) {
      data['default_currency'] = defaultCurrency!.toJson();
    }
    return data;
  }
}

class Activation {
  bool? couponEnable;
  bool? walletEnable;
  bool? serviceAutoApprove;
  bool? providerAutoApprove;

  Activation(
      {this.couponEnable,
      this.walletEnable,
      this.serviceAutoApprove,
      this.providerAutoApprove});

  Activation.fromJson(Map<String, dynamic> json) {
    couponEnable = json['coupon_enable'];
    walletEnable = json['wallet_enable'];
    serviceAutoApprove = json['service_auto_approve'];
    providerAutoApprove = json['provider_auto_approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_enable'] = couponEnable;
    data['wallet_enable'] = walletEnable;
    data['service_auto_approve'] = serviceAutoApprove;
    data['provider_auto_approve'] = providerAutoApprove;
    return data;
  }
}

class ProviderCommissions {
  bool? commissionsStatus;
  int? minWithdrawAmount;
  int? defaultCommissionRate;
  bool? isCategoryBasedCommission;

  ProviderCommissions(
      {this.commissionsStatus,
      this.minWithdrawAmount,
      this.defaultCommissionRate,
      this.isCategoryBasedCommission});

  ProviderCommissions.fromJson(Map<String, dynamic> json) {
    commissionsStatus = json['commissions_status'];
    minWithdrawAmount = json['min_withdraw_amount'];
    defaultCommissionRate = json['default_commission_rate'];
    isCategoryBasedCommission = json['is_category_based_commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commissions_status'] = commissionsStatus;
    data['min_withdraw_amount'] = minWithdrawAmount;
    data['default_commission_rate'] = defaultCommissionRate;
    data['is_category_based_commission'] = isCategoryBasedCommission;
    return data;
  }
}

class PaymentMethods {
  String? name;
  bool? status;

  PaymentMethods({this.name, this.status});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
