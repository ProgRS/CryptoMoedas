import 'package:crypto/repositories/moves_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovimentacoesPage extends StatefulWidget {
  const MovimentacoesPage({Key? key}) : super(key: key);

  @override
  State<MovimentacoesPage> createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState extends State<MovimentacoesPage> {
  final moveTable = MovesRepository.tabela;


  @override
  Widget build(BuildContext context) {
    String titleMoviment = AppLocalizations.of(context)!.nameMovement;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            titleMoviment,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(         
              children: [
              Movement(moveTable, 0),
              Movement(moveTable, 1),
              Movement(moveTable, 2),
              Movement(moveTable, 0),
              Movement(moveTable, 1),
              ],
            ),
         
        );    
  }
}

class Movement extends StatelessWidget {
  final moveTable;
  final int count;
  const Movement(this.moveTable, this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.compare_arrows_rounded),
      subtitle: Text(moveTable[this.count].data),
      title: Text(moveTable[this.count].sigla),
      trailing: Column(
        children: [
          Title(
            color: Colors.grey,
            child: Text(
              '${moveTable[this.count].valor}' + moveTable[this.count].sigla,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              textWidthBasis: TextWidthBasis.longestLine,
              style: const TextStyle(
                height: 2,
              ),
            ),
          ),
          Title(
              color: Colors.grey,
              child: Text(moveTable[this.count].valorConv,
                  style: TextStyle(color: Colors.grey)))
        ],
      ),
    );
  }
}
