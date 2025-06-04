part of '../global_widgets.dart';

class AppTextfield extends StatefulWidget {
  const AppTextfield({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.onChange,
    this.suffixIcon,
    this.inputFormatters,
    this.isSearchField = false,
    this.keyboardType,
  });
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText, isSearchField;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String val)? onChange;
  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onTapOutside: (event) => _focusNode.unfocus(),
      onChanged: widget.onChange,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon:
            widget.isSearchField
                ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: ProductAssets.search.svg(
                    color:
                        _focusNode.hasFocus
                            ? AppColors.primary
                            : Theme.of(context).disabledColor,
                  ),
                )
                : widget.prefixIcon == null
                ? null
                : Icon(
                  widget.prefixIcon,
                  color:
                      _focusNode.hasFocus
                          ? AppColors.primary
                          : Theme.of(context).disabledColor,
                ),
        suffixIcon: widget.suffixIcon,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: widget.obscureText,
    );
  }
}
