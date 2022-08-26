import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game_project/sonuc_ekrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101);
    print("Rasgele Sayi: $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("KALAN HAK: $kalanHak", style: TextStyle(fontSize: 30, color: Colors.pink),),
            Text("Yardım: $yonlendirme", style: TextStyle(fontSize: 24, color: Colors.grey),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: (){

                  setState(() {
                    kalanHak -= 1;
                  });
                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rasgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                    return;
                  }
                  if(tahmin > rasgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini azalt";
                    });
                  }
                  if(tahmin < rasgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini arttır";
                    });
                  }

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false,)));
                  }

                  tfTahmin.text = "";
                },
                child: Text("TAHMİN ET", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
