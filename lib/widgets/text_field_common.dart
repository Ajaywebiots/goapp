import 'package:flutter/services.dart';

import '../config.dart';

class TextFieldCommon extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText, prefixIcon, prefixImage;
  final TextStyle? hintStyle;
  final bool? isNumber, isPrefImage;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  final bool readOnly;

  const TextFieldCommon(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.prefixImage,
      this.isPrefImage = false,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.isNumber = false,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.hintStyle,
      this.hPadding,
      this.isMaxLine = false,
      this.onTap,
      this.inputFormatters,
      this.readOnly = false});

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  late FocusNode _focusNode;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            canvasColor: appColor(context).whiteBg,
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black, selectionHandleColor: Colors.black)),
        child: TextFormField(
            readOnly: widget.readOnly,
            maxLines: widget.maxLines ?? 1,
            style: appCss.dmDenseMedium14.textColor(appColor(context).darkText),
            focusNode: _focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: widget.obscureText,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            controller: widget.controller,
            onChanged: widget.onChanged,
            minLines: widget.minLines,
            cursorColor: appColor(context).darkText,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
                counterText: widget.counterText,
                fillColor: widget.fillColor ?? appColor(context).whiteBg,
                filled: true,
                isDense: true,
                disabledBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide.none),
                focusedBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide.none),
                enabledBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide.none),
                border: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide.none),
                contentPadding: widget.isMaxLine
                    ? const EdgeInsets.only(
                        left: Sizes.s45,
                        right: Insets.i15,
                        top: Insets.i15,
                        bottom: Insets.i15)
                    : EdgeInsets.symmetric(
                        horizontal: widget.hPadding ?? Insets.i15,
                        vertical: widget.vertical ?? Insets.i15),
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.isPrefImage == true
                    ? Image.asset(widget.prefixImage.toString(), height: Insets.i4)
                        .marginSymmetric(vertical: 10)
                    : widget.isNumber == true
                        ? null
                        : SvgPicture.asset(widget.prefixIcon!,
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(
                                !widget.focusNode!.hasFocus
                                    ? widget.controller!.text.isNotEmpty
                                        ? appColor(context).darkText
                                        : appColor(context).lightText
                                    : appColor(context).darkText,
                                BlendMode.srcIn)),
                hintStyle: widget.hintStyle ??
                    appCss.dmDenseRegular14
                        .textColor(appColor(context).lightText),
                hintText: language(context, widget.hintText),
                errorMaxLines: 2)));
  }
}

class TextFieldCommon1 extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText, prefixIcon;
  final TextStyle? hintStyle;
  final bool? isNumber;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCommon1(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.isNumber = false,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.hintStyle,
      this.hPadding,
      this.isMaxLine = false,
      this.onTap,
      this.inputFormatters});

  @override
  State<TextFieldCommon1> createState() => _TextFieldCommon1State();
}

class _TextFieldCommon1State extends State<TextFieldCommon1> {
  late FocusNode _focusNode;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            canvasColor: appColor(context).whiteBg,
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black, selectionHandleColor: Colors.black)),
        child: TextFormField(
            maxLines: widget.maxLines ?? 1,
            style: appCss.dmDenseMedium14.textColor(appColor(context).darkText),
            focusNode: _focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: widget.obscureText,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            controller: widget.controller,
            onChanged: widget.onChanged,
            minLines: widget.minLines,
            cursorColor: appColor(context).darkText,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
                counterText: widget.counterText,
                fillColor: widget.fillColor ?? appColor(context).whiteBg,
                filled: true,
                isDense: true,
                disabledBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide(
                            color: appColor(context).borderStroke, width: 1.5)),
                focusedBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide.none),
                enabledBorder: widget.border ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? AppRadius.r8)),
                        borderSide: BorderSide(
                            color: appColor(context).borderStroke, width: 1.5)),
                border:
                    widget.border ?? OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? AppRadius.r8)), borderSide: BorderSide.none),
                contentPadding: widget.isMaxLine ? const EdgeInsets.only(left: Sizes.s45, right: Insets.i15, top: Insets.i15, bottom: Insets.i15) : EdgeInsets.symmetric(horizontal: widget.hPadding ?? Insets.i15, vertical: widget.vertical ?? Insets.i15),
                suffixIcon: widget.suffixIcon,
                hintStyle: widget.hintStyle ?? appCss.dmDenseMedium14.textColor(appColor(context).lightText),
                hintText: language(context, widget.hintText),
                errorMaxLines: 2)));
  }
}
