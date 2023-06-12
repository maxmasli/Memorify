import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppNumberTextField extends StatelessWidget {
  const AppNumberTextField(
      {required this.onChanged, this.errorText, super.key});

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(

        style: const TextStyle(fontSize: 22),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3)
        ],
        onChanged: onChanged,
        cursorColor: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .color,
        decoration: InputDecoration(
            errorText: errorText,
            contentPadding: const EdgeInsets.all(8),
            isCollapsed: true,
            errorStyle: const TextStyle(fontSize: 14),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .color!,
              ),
            )
        ),
      ),
    );
  }
}
