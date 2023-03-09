import 'package:flutter/material.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';

class ImpressumScreen extends StatefulWidget {
  const ImpressumScreen({Key? key}) : super(key: key);

  @override
  State<ImpressumScreen> createState() => _ImpressumScreenState();
}

class _ImpressumScreenState extends State<ImpressumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('', context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Impressum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Hochschule Fulda \n Leipziger Straße 123 \n 36037 Fulda \n Telefon: +49 661 9640-0 \n Fax: +49 661 9640-1229 \n Internet: www.hs-fulda.de',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Gesetzlicher Vertreter: Der Präsident der Hochschule Fulda, Prof. Dr. Karim Khakzar \n Rechtsform: Körperschaft des öffentlichen Rechts \n Gerichtsstand: Fulda',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Zuständige Aufsichtsbehörde: Hessisches Ministerium für Wissenschaft und Kunst,\n Rheinstraße 23-25, 65185 Wiesbaden ',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Umsatzsteuer-ID-Nummer: DE 166 496 730',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Wenn Sie Anregungen zur Erweiterung unseres Informationsangebots oder Hinweise auf \n zu korrigierende Fehler haben, schreiben Sie bitte an \n onlineredaktion(at)verw.hs-fulda.de.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Copyright',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '\n \n ',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Haftungsausschluss',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Trotz sorgfältiger inhaltlicher Kontrolle übernehmen wir keine Haftung für die Inhalte \n externer Links. Sie stellen kein Angebot der Hochschule Fulda dar. Für den Inhalt der ver \n linkten Seiten sind ausschließlich deren Betreiber verantwortlich.',
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 28, 31, 31),
          fontSize: 28,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: Color.fromARGB(255, 28, 31, 31),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EinstellungenScreen()));
        },
      ),
      actions: [],
    );
  }
}
