import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/direcciones_page.dart';
import 'package:flutter_qr_reader/pages/mapa_page.dart';
import 'package:flutter_qr_reader/pages/mapas_page.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:flutter_qr_reader/widgets/custom_navigator.dart';
import 'package:flutter_qr_reader/widgets/scan_bottom.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final tempScan = new ScanModel(valor: 'http://google.com');
    DBProvider.db.nuevoScan(tempScan);

    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapaPage();
    }
  }
}
