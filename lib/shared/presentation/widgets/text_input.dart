import 'package:caffeine_tracker/common/const/colors.dart';
import 'package:caffeine_tracker/common/const/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.isNumber = false,
    this.hintText = '',
    this.showIcon = false,
    this.text = '',
    this.suffixText = '',
    this.onChange,
  });

  final bool isNumber;
  final String hintText;
  final bool showIcon;
  final String text;
  final String suffixText;
  final ValueChanged<String>? onChange;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant TextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text && widget.text != _controller.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      style: AppFonts.small.copyWith(
        color: AppColors.primary.withValues(alpha: 0.8),
        decorationThickness: 0,
      ),
      cursorColor: AppColors.fg.withValues(alpha: 0.8),
      keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        hint: Text(
          widget.hintText,
          style: AppFonts.small.copyWith(
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
        ),
        fillColor: AppColors.surface.withValues(alpha: 0.9),
        filled: true,
        isDense: false,
        isCollapsed: false,
        prefixIcon: widget.showIcon
            ? Icon(CupertinoIcons.search, color: AppColors.fg02)
            : null,

        suffixIcon: widget.suffixText.isEmpty
            ? null
            : Padding(
                padding: context.edgeInsets(top: 12),
                child: Text(
                  widget.suffixText,
                  style: AppFonts.small.copyWith(
                    color: AppColors.primary.withValues(alpha: 0.8),
                  ),
                ),
              ),
        contentPadding: context.edgeInsets(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.r(14)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.r(14)),
          borderSide: BorderSide(color: AppColors.fg),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.r(14)),
          borderSide: BorderSide(
            color: AppColors.line.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
      ),
    );
  }
}
