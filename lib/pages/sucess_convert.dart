import 'package:flutter/material.dart';

import '../Shared/themes/app_images.dart';


class SucessConvert extends StatelessWidget {
  const SucessConvert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(AppIcons.iconConfirm),
          ),
          title: Text("Conversão Efetuada",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Text(
            "Conversão de moeda efetuada com sucesso!",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}