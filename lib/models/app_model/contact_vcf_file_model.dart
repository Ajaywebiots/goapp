String generateVCF(List<Map<String, dynamic>> items, String businessName) {
  String? phone;
  String? email;
  String? address;
  String? website;
  String? facebook;
  String? instagram;
  String? tiktok;
  String? youtube;

  for (var item in items) {
    final label = item['label']?.toString().toLowerCase() ?? '';
    final value = item['contactAction']?.toString() ?? '';
    if (label.contains('+') || label.contains('tel')) {
      phone = value;
    } else if (label.contains('@'))
      email = value;
    else if (label.contains('facebook'))
      facebook = value;
    else if (label.contains('instagram'))
      instagram = value;
    else if (label.contains('tiktok'))
      tiktok = value;
    else if (label.contains('youtube'))
      youtube = value;
    else if (label.contains('www') || label.contains('http'))
      website = value;
    else if (label.contains('mountain view') || label.contains('street'))
      address = value;
  }

  return '''
BEGIN:VCARD
VERSION:3.0
FN:$businessName
TEL:$phone
EMAIL:$email
ADR:;;$address
URL:$website
X-SOCIALPROFILE;type=facebook:$facebook
X-SOCIALPROFILE;type=instagram:$instagram
X-SOCIALPROFILE;type=tiktok:$tiktok
X-SOCIALPROFILE;type=youtube:$youtube
END:VCARD
''';
}
