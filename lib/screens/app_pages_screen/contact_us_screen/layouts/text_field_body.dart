import '../../../../config.dart';
import '../../../../providers/app_pages_provider/contact_us_provider.dart';

class TextFieldBody extends StatelessWidget {
  const TextFieldBody({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ContactUsProvider>(context, listen: true);
    return Form(
        key: value.contactKey,
        child: Column(children: [
          ContainerWithTextLayout(title: language(context, "Select Subject")),
          const VSpace(Sizes.s8),
          DropdownButtonFormField<String>(
                  value: value.selectedValue,
                  onChanged: (String? newValue) {
                    value.notifyListeners();
                    value.selectedValue = newValue;
                    value.notifyListeners();
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: Insets.i16, horizontal: Insets.i12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white))),
                  icon: SvgPicture.asset(eSvgAssets.arrowDown,
                      height: Insets.i18,
                      colorFilter: ColorFilter.mode(
                          appColor(context).darkText, BlendMode.srcIn)),
                  items: <String>[
                    'Technical Error',
                    'UI Bug',
                    'Performance Issue'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: appCss.dmDenseRegular14
                                .textColor(appColor(context).darkText)));
                  }).toList())
              .marginSymmetric(horizontal: Insets.i20),
          const VSpace(Sizes.s15),
          ContainerWithTextLayout(title: language(context, "Message")),
          const VSpace(Sizes.s8),
          TextFieldCommon(
                  hintText: language(context, appFonts.writeHere),
                  minLines: 15,
                  maxLines: 15,
                  focusNode: value.messageFocus,
                  validator: (val) => validation.commonValidation(context, val),
                  isNumber: true,
                  controller: value.messageController)
              .padding(horizontal: Insets.i20, bottom: Insets.i46)
        ]).paddingSymmetric(vertical: Insets.i20));
  }
}
