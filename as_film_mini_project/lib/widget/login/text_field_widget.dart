// import 'package:as_film_mini_project/theme/theme_color.dart';
import 'package:flutter/material.dart';
// import 'package:as_film_mini_project/theme/theme_color.dart';
// import 'package:as_film_mini_project/theme/theme_text_style.dart';


// class TextFieldWidget extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final bool isPassword;
//   final bool isObscure;
//   final void Function() onTap;

//   const TextFieldWidget({super.key, 
//     required this.controller,
//     required this.labelText,
//     this.isPassword = false,
//     this.isObscure = true,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         suffixIcon: isPassword
//             ? IconButton(
//                 icon: Icon(
//                   isObscure ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: onTap,
//               )
//             : null,
//       ),
//       obscureText: isObscure,
//     );
//   }
// }

class TextFieldWidget extends StatefulWidget {
  final String label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText;
  final bool isPassword; // Tambahkan parameter isPassword

  const TextFieldWidget({super.key, 
    required this.label,
    // required this.hintText,
    required this.onChanged,
    this.controller,
    this.textInputType,
    this.errorText,
    this.isPassword = false, // Defaultnya bukan tipe kata sandi
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  bool _obscureText = true; // Tambahkan state _obscureText

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? _obscureText : false, // Set tipe kata sandi
      decoration: InputDecoration(
        errorText: widget.errorText,
        label: Text(
          widget.label,
          style: const TextStyle(fontSize: 20),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: widget.isPassword // Tampilkan ikon mata jika tipe password
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Mengganti visibilitas kata sandi
                  });
                },
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}