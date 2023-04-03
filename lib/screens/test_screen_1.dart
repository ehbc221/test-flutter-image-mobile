import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/demande.model.dart';

class TestScreen1 extends StatefulWidget {
  @override
  State<TestScreen1> createState() => _TestScreen1State();
}

class _TestScreen1State extends State<TestScreen1> {
  late Future<http.Response> _futureListeDemandes;

  @override
  void initState() {
    super.initState();
    // Initialize the future builder
    Uri url = Uri.http('localhost:8081', 'api/demandes');
    _futureListeDemandes = http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demandes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 18),
            Text('Liste des photos'),
            SizedBox(height: 18),
            FutureBuilder<http.Response>(
                future: _futureListeDemandes,
                builder: (BuildContext context,
                    AsyncSnapshot<http.Response> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    print('Response status: ${snapshot.data!.statusCode}');
                    print('Response body: ${snapshot.data!.body}');
                    List<Demande> demandes =
                        (json.decode(snapshot.data!.body) as List<dynamic>)
                            .map((demande) => Demande.fromJson(demande))
                            .toList();
                    return Column(
                      children: demandes
                          .map(
                            (demande) => ListTile(
                              leading:
                                  Image.memory(base64Decode(demande.photo)),
                              title: Text('Demande numéro ${demande.id}'),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Text(
                      'Erreur lors du chargement de la liste des demandes',
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
