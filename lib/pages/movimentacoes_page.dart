

import 'package:flutter/material.dart';
class MovimentacoesPage extends StatefulWidget {
  const MovimentacoesPage({Key? key}) : super(key: key);

  @override
  State<MovimentacoesPage> createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState extends State<MovimentacoesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text('Movimentações',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

      ),

      body:
        SingleChildScrollView(
           child: Column(
             children: [
               Movement(),
               Movement(),
               Movement(),
               Movement(),
               Movement(),
             ],
           ),
        )
    );
    //);
  }
}

class Movement extends StatelessWidget {
  const Movement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget> [
        ListTile(
          leading: Icon(Icons.compare_arrows_rounded),
          subtitle: Text("11/04/2022"),
          title: Text('1BTC'),
          trailing: Column(
            children: [
              Title(
                color: Colors.grey,
                child: Text('18,44ETH',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  textWidthBasis:
                  TextWidthBasis.longestLine,
                  style: const TextStyle(
                    height: 2,
                  ),
                ),

              ),
              Title(color: Colors.grey,
                  child: Text('R\$0,00', style: TextStyle(color: Colors.grey)))
            ],
          ),
        ),
        Divider(color: Colors.grey,),
      ],
    );
  }
}

