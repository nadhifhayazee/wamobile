import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatWhatsappButton extends StatelessWidget {
  final String phoneNumber;
  final String? message;
  final ButtonStyle? style;
  final Widget child;
  final VoidCallback? onPressed;

  ChatWhatsappButton({this.onPressed,
    required this.child,
    required this.phoneNumber,
    this.style,
    this.message});

  void openWhatsapp(BuildContext context) async {
    if (this.phoneNumber.isNotEmpty) {
      Uri url = Uri(
          scheme: "https",
          host: "wa.me",
          path: "${generatePhone(this.phoneNumber)}",
          queryParameters: {'text': '${this.message}'});
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text("Gagal membuka url.")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text("Nomor whatsapp harus diisi!")));

    }
  }

  String generatePhone(String phoneInput) {
    var initialNum = phoneInput[0] + phoneInput[1];
    if (initialNum != '62') {
      return "62" + phoneInput.substring(1);
    }
    return phoneInput;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: this.style,
      child: this.child,
      onPressed: () {
        openWhatsapp(context);
        this.onPressed?.call();
      },
    );
  }
}
