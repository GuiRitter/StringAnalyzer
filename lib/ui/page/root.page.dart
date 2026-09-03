import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;
import 'package:flutter_guiritter/common/_import.dart' show MIMEType;
import 'package:flutter_guiritter/model/_import.dart' show InitModel;
import 'package:flutter_guiritter/ui/page/_import.dart' show SplashPage;
import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:string_analyzer/common/_import.dart' show AppLocalizations;
import 'package:string_analyzer/theme/_import.dart'
    show circularProgressIndicatorColor;
import 'package:string_analyzer/ui/page/_import.dart' show HomePage;

final _log = logger('RootPage');

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<Map<String, dynamic>, InitModel<AppLocalizations>>(
        distinct: true,
        converter: InitModel.select,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    InitModel<AppLocalizations> initModel,
  ) {
    _log('connectorBuilder').map('initModel', initModel).print();

    return initModel.isEveryInitDataLoaded
        ? HomePage()
        : SplashPage(
            backgroundMimeType: MIMEType.imagePng,
            backgroundAssetName:
                'asset/The_Howler_(1918)_-_DPLA_-_b4e815671fc8ec7e8ae252c7916b3a13_(page_6).jpg',
            backgroundSemanticsLabel:
                'logo background: photo of a blank parchment page',
            logoMimeType: MIMEType.imageSvgXml,
            logoAssetName: 'asset/logo.svg',
            logoSemanticsLabel:
                'logo representing a looking glass on top of a parchment page with some characters written in it',
            circularProgressIndicatorColor: circularProgressIndicatorColor,
          );
  }
}
