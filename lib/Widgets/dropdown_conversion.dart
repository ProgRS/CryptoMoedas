import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  final void Function(String) onChangedCrypto;
  const DropdownList({Key? key, required this.onChangedCrypto})
      : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String selectCrypto = "Bitcoin";

  @override
  Widget build(BuildContext context) {    
    final Map<int, String> moedas = Map();
    moedas[1] = "Bitcoin";
    moedas[2] = "Litecoin";
    moedas[3] = "Ethereum";
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(
          child: Text(moedas[1].toString()),
          value: moedas[1],
        ),
        DropdownMenuItem(
          child: Text(moedas[2].toString()),
          value: moedas[2],
        ),
        DropdownMenuItem(
          child: Text(moedas[3].toString()),
          value: moedas[3],
        ),
      ],
      onChanged: (crypto) {
        setState(() {
          selectCrypto = crypto.toString();
        });
        widget.onChangedCrypto(crypto.toString());
      },
      value: selectCrypto,
      hint: Text(selectCrypto),
      alignment: Alignment.topRight,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
