import 'package:characters/characters.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        ElevatedButton,
        Expanded,
        InputDecoration,
        MainAxisAlignment,
        Row,
        Scaffold,
        StatelessWidget,
        TextEditingController,
        TextField,
        TextInputType,
        Widget;
import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:string_analyzer/ui/widget/_import.dart' show getTextL;

final _log = logger('HomePage');

class HomePage extends StatelessWidget {
  final inputController = TextEditingController(
    text: 'Hello, World!',
  );

  final outputController = TextEditingController();

  HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        appBar: AppBar(
          title: getTextL((l) => l!.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    label: getTextL((l) => l!.input),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: generateOutput,
                      child: getTextL((l) => l!.analyze),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TextField(
                  controller: outputController,
                  decoration: InputDecoration(
                    label: getTextL((l) => l!.output),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      );

  String characterToAnalysis(
    String character,
  ) {
    final codeUnitList = character.codeUnits;

    String delimiterLeft = '>';
    String delimiterRight = '<';

    if ((codeUnitList.length == 1) && (codeUnitList[0] < 256)) {
      delimiterLeft = '»';
      delimiterRight = '«';
    }

    return '$delimiterLeft$character$delimiterRight ${codeUnitList.join(
      ', ',
    )}';
  }

  void generateOutput() {
    final input = inputController.text;

    _log('generateOutput').raw('input', input).print();

    final output = input.characters
        .map(
          characterToAnalysis,
        )
        .join(
          '\n',
        );

    _log('generateOutput').raw('output', output).print();

    outputController.text = output;
  }
}
