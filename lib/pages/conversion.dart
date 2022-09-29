


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widgets/conversion_button.dart';
import '../Widgets/dropdown_conversion.dart';
import '../Widgets/my_app_bar.dart';
import '../Widgets/value_crypto.dart';
import 'carteiraApp.dart';
import 'sucess_convert.dart';



class ConversionCoin extends StatefulWidget {
  final ConvertButton? buttonName;
  const ConversionCoin({Key? key, this.buttonName}) : super(key: key);

  @override
  State<ConversionCoin> createState() => _ConversionCoinState();
}

class _ConversionCoinState extends State<ConversionCoin> {
  String selectCryptoConvert = "";
  String selectCryptoReceive = "";
  String pagename = "Conversão de Moeda";
  final _convertFron = GlobalKey<FormState>();
  final _value = TextEditingController();
  final _receiveIn = GlobalKey<FormState>();
  final _valueReceive = TextEditingController();

  void selectCoinConvert(String value) {
    setState(() => selectCryptoConvert = value);
  }

  void selectCoinReceive(String value) {
    setState(() => selectCryptoReceive = value);
  }

  void percentConvert(double value2) {
    final valorTotal2 = double.parse(_value.text);
    final valorTotal = valorTotal2 * (value2);
    _valueReceive.text = valorTotal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: MyAppBar(pageName: pagename),
          preferredSize: const Size(double.infinity, 50)),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 400.0,
                  height: 30.0,
                  child: Text(
                    "Converter de:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  height: 80.0,
                  child: DropdownList(
                      onChangedCrypto: (crypto) => selectCoinConvert(crypto)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                        key: _convertFron,
                        controller: _value,
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Montante:"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (validValue) {
                          if (validValue!.isEmpty) {
                            return "Informe o valor";
                          } else if (double.parse(validValue) > 0) {}
                          return null;
                        }),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ConvertButton(
                    buttonName: 25,
                    valueCoin: ValueCoin(),
                    onPressed: () {
                      percentConvert(0.25);
                    },
                  ),
                  ConvertButton(
                    buttonName: 50,
                    valueCoin: ValueCoin(),
                    onPressed: () {
                      percentConvert(0.5);
                    },
                  ),
                  ConvertButton(
                    buttonName: 75,
                    valueCoin: ValueCoin(),
                    onPressed: () {
                      percentConvert(0.75);
                    },
                  ),
                  ConvertButton(
                    buttonName: 100,
                    valueCoin: ValueCoin(),
                    onPressed: () {
                      percentConvert(1);
                    },
                  ),
                ]),
                const Divider(),
                const SizedBox(
                  width: 400.0,
                  height: 30.0,
                  child: Text(
                    "Para receber em:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  height: 80.0,
                  child: DropdownList(
                      onChangedCrypto: (crypto) => selectCoinReceive(crypto)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      readOnly: true,
                      key: _receiveIn,
                      controller: _valueReceive,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Montante pós conversão:"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 255, 255))),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) =>  const TelaInicialWidget(),
                      ),

                      );

                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                        MaterialStateProperty.all(Colors.pink)),
                    onPressed: () {
                      if (double.parse(_valueReceive.text) >= 0) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const SucessConvert());
                      } else {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) =>
                            const AlertDialog(
                              title: Text("Ops, algo deu errado!"),
                            ));
                      }
                    },
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ]),
        ),
      ),
    );
  }
}
