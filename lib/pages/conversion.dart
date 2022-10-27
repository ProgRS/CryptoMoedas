import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widgets/conversion_button.dart';
import '../Widgets/dropdown_conversion.dart';
import '../Widgets/my_app_bar.dart';
import '../Widgets/value_crypto.dart';
import 'carteiraApp.dart';
import 'sucess_convert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ConversionCoin extends StatefulWidget {
  final ConvertButton? buttonName;
  const ConversionCoin({Key? key, this.buttonName}) : super(key: key);

  @override
  State<ConversionCoin> createState() => _ConversionCoinState();
}

class _ConversionCoinState extends State<ConversionCoin> {
  String selectCryptoConvert = "";
  String selectCryptoReceive = "";
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
    final pagename = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
          child: MyAppBar(pageName: pagename.nameCoinConvert),
          preferredSize: const Size(double.infinity, 50)),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                 SizedBox(
                  width: 400.0,
                  height: 30.0,
                  child: Text(
                    AppLocalizations.of(context)!.nameConvert,
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
                        decoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.nameAmount),
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
                SizedBox(
                  width: 400.0,
                  height: 30.0,
                  child: Text(
                    AppLocalizations.of(context)!.nameConvertIn,
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
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: AppLocalizations.of(context)!.nameAmountAfter),
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
                      Navigator.pushNamed(context, '/carteiraApp',
                          arguments: "1");
                    },
                    child:  Text(
                        AppLocalizations.of(context)!.nameBtnCancel,
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
                    child:  Text(
                      AppLocalizations.of(context)!.nameBtnConfirm,
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
