import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imgPadrao = AssetImage("assets/imagens/padraao.png");
  var msg = 'Resultado:';
  int contusu = 0;
  int contia = 0;
  void opcao(String escolhaUsuario) {
    var opcoes = ["Pedra", "Tesoura", "Papel"];
    var numero = Random().nextInt(3);
    var escolhaIa = opcoes[numero];

    switch (escolhaIa) {
      case "Pedra":
        setState(() {
          imgPadrao = AssetImage(imgPedra);
        });
        break;
      case "Papel":
        setState(() {
          imgPadrao = AssetImage(imgPapel);
        });
        break;
      case "Tesoura":
        setState(() {
          imgPadrao = AssetImage(imgTesoura);
        });
        break;
    }

    if ((escolhaUsuario == "Pedra" && escolhaIa == "Tesoura") ||
        (escolhaUsuario == "Papel" && escolhaIa == "Pedra") ||
        (escolhaUsuario == "Tesoura" && escolhaIa == "Papel")) {
      contusu++;
      print(contusu);
      setState(() {
        this.msg = "Boaa, você ganhou! :)";
      });
    } else if ((escolhaIa == "Pedra" && escolhaUsuario == "Tesoura") ||
        (escolhaIa == "Papel" && escolhaUsuario == "Pedra") ||
        (escolhaIa == "Tesoura" && escolhaUsuario == "Papel")) {
      contia++;
      print(contia);
      setState(() {
        this.msg = "Ahh você perdeu :( ";
      });
    } else {
      setState(() {
        this.msg = "Foram bem, por isso deu empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(227, 125, 197, 0.83),
          title: Text("JokenPo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha da IA",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: imgPadrao, height: 100),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => opcao("Pedra"),
                  child: Image.asset(
                    imgPedra,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcao("Papel"),
                  child: Image.asset(
                    imgPapel,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcao("Tesoura"),
                  child: Image.asset(
                    imgTesoura,
                    height: 100,
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
            Text(
              this.msg,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 30, bottom: 10)),
            Text(
              "Pontuação:",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              //alinhamento
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imgPlayer,
                  height: 100,
                ),
                Text(contusu.toString(),
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                Text("x",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                Text(contia.toString(),
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                Image.asset(
                  imgBot,
                  height: 100,
                ),
              ],
            )
          ],
        ));
  }
}
