import 'package:dio/utils/routes.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Function? onPress;
  final TextInputType? typeKeyboard;
  final Function(String value) change;
  final bool isVisible;
  final Icon iconInput;
  final bool redonly;
  final int? maxCaracter;
  final TextEditingController? controllerField;
  const Input({
    super.key,
    required this.placeholder,
    this.typeKeyboard,
    this.onPress,
    this.maxCaracter,
    this.redonly = false,
    this.isVisible = false,
    this.controllerField,
    required this.iconInput,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxCaracter,
      keyboardType: typeKeyboard,
      readOnly: redonly,
      controller: controllerField,
      obscureText: isVisible,
      obscuringCharacter: '*',
      onChanged: (value) => change(value),
      cursorColor: ModalRoute.of(context)?.settings.name == Routes.register ||
              ModalRoute.of(context)?.settings.name == Routes.adress
          ? Colors.black
          : Colors.white,
      style: TextStyle(
          color: ModalRoute.of(context)?.settings.name == Routes.register ||
                  ModalRoute.of(context)?.settings.name == Routes.adress
              ? Colors.black
              : Colors.white,
          fontSize: 16),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: placeholder,
        prefixIcon: iconInput,
        focusColor: Colors.purple,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        prefixIconColor: Colors.purple,
        suffixIcon: onPress != null
            ? IconButton(
                onPressed: () => onPress!(),
                icon: isVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        suffixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? Colors.purple
                : Colors.white),
        hintStyle: TextStyle(
            fontSize: 20,
            color: ModalRoute.of(context)?.settings.name == Routes.register ||
                    ModalRoute.of(context)?.settings.name == Routes.adress
                ? Colors.black
                : Colors.white),
      ),
    );
  }
}
