


import 'package:aula_01/component/HelperText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets("Teste do componente HelperText", (WidgetTester tester) async{
        await tester.pumpWidget(MaterialApp(home: HelperText(text:"")));
         final mainText = find.byType(Text);
         expect(mainText, findsOneWidget);
  });
}