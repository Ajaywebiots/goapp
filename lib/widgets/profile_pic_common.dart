import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../config.dart';

class ProfilePicCommon extends StatelessWidget {
  final bool? isProfile;

  final String? imageUrl;
  final XFile? image;

  const ProfilePicCommon(
      {super.key, this.imageUrl, this.image, this.isProfile});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      image != null
          ? Container(
              height: Sizes.s88,
              width: Sizes.s88,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff162e0f).withValues(alpha: 0.2),
                        offset: Offset(0, 2),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(File(image!.path)), fit: BoxFit.cover),
                  border: Border.all(
                      color: isProfile == true
                          ? appColor(context).whiteBg.withOpacity(0.75)
                          : appColor(context).trans,
                      width: isProfile == true ? 4 : 2,
                      style: BorderStyle.solid)))
          : imageUrl != null
              ? Container(
                  height: Sizes.s88,
                  width: Sizes.s88,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff162e0f).withValues(alpha: 0.2),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(imageUrl!), fit: BoxFit.cover),
                      border: Border.all(
                          color: isProfile == true
                              ? appColor(context).whiteBg.withOpacity(0.75)
                              : appColor(context).trans,
                          width: isProfile == true ? 4 : 2,
                          style: BorderStyle.solid)))
              : Container(
                  height: Sizes.s88,
                  width: Sizes.s88,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.profile),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff162e0f).withValues(alpha: 0.2),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      border: Border.all(
                          color: isProfile == true
                              ? appColor(context).whiteBg.withOpacity(0.75)
                              : appColor(context).trans,
                          width: isProfile == true ? 4 : 2,
                          style: BorderStyle.solid))),
      /*Container(
          height: Sizes.s88,
          width: Sizes.s88,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image != null
                  ? DecorationImage(
                      image: FileImage(File(image!.path)), fit: BoxFit.cover)
                  : imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl!), fit: BoxFit.cover)
                      : DecorationImage(
                          image: AssetImage(eImageAssets.profile),
                          fit: BoxFit.cover),
              border: Border.all(
                  color: isProfile == true
                      ? appColor(context).whiteBg.withOpacity(0.75)
                      : appColor(context).trans,
                  width: isProfile == true ? 4 : 2,
                  style: BorderStyle.solid))),*/
      Container(
          height: isProfile == true ? Sizes.s82 : Sizes.s85,
          width: isProfile == true ? Sizes.s82 : Sizes.s85,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: appColor(context).whiteBg,
                  width: isProfile == true ? 2 : 1,
                  style: BorderStyle.solid)))
    ]);
  }
}
