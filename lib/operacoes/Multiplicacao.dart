import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:math';


class Multiplicacao extends StatefulWidget {
  

  @override
  _MultiplicacaoState createState() => _MultiplicacaoState();
}

class _MultiplicacaoState extends State<Multiplicacao> {
  int acertos = 0;
  int erros = 0;
  int scnd = 1;
  String _current_difficult = null;
  Timer timer;
  Color colorF = Color.fromRGBO(50,205,50,1);
  Color colorM = Color.fromRGBO(50,205,50,1);
  Color colorD = Color.fromRGBO(50,205,50,1);
  var bool = true;
  
   void showToast() {
      Fluttertoast.showToast(
          msg: 'Selecione uma dificuldade!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );
    }

  Random rand = Random();
  List _results = [];
  var clock = 1;
  var a,b,result;
  var min = 1 ,minaux = 1,max = 1 ,maxaux= 1;

  void randomAdd(List results){
    var aux =  rand.nextInt(4);
    switch (aux){

      case 0:
          results.add(result);
          results.add(result-1);
          results.add(result-2);
          results.add(result+2);
          results.add(result+1);
        break;
      case 1:
          results.add(result-2);
          results.add(result-1);
          results.add(result);
          results.add(result+2);
          results.add(result+1);
      break;

      case 2:
          results.add(result-2);
          results.add(result);
          results.add(result-1);
          results.add(result+2);
          results.add(result+1);
      break;

      case 3:
          results.add(result-2);
          results.add(result-1);
          results.add(result+2);
          results.add(result);
          results.add(result+1);
      break;

      case 4:
          results.add(result-2);
          results.add(result-1);
          results.add(result+2);
          results.add(result+1);
          results.add(result);
      break;
        }


  }
  
  void generateMath(){

      
      setState(() {
      a = minaux + rand.nextInt(min);
      b = maxaux +  rand.nextInt(max);
      result = a*b;
      _results = [];
      randomAdd(_results);
     

      });
        
  }
   startTimer() {
  // Start the periodic timer which prints something every 1 seconds
   timer =  Timer.periodic( Duration(seconds: scnd), (time) {
    setState(() {
      clock +=1;
    });
   
  });
  generateMath();
 
 
}

setDesempenho(){

  int total = acertos + erros;
  double porcAcertos = acertos*100/total;
  double porcErros =  erros*100/total;
  String aproveitamento;
  String kd;
  double tempoParaResolver = clock/total;
  String tempoClassificacao;

  if (tempoParaResolver <= 2){
    tempoClassificacao = 'Excelente, nota 10!';
  }else if (tempoParaResolver > 2 && tempoParaResolver <= 3){
    tempoClassificacao = 'Bom';
  } else if(tempoParaResolver > 3 && tempoParaResolver <= 4){
    tempoClassificacao = 'Da pra melhorar...';
  } else if (tempoParaResolver > 4 && tempoParaResolver <= 5){
          tempoClassificacao = 'Ruim. Você consegue melhorar!';
  } else if (tempoParaResolver > 5){
          tempoClassificacao = 'Péssimo, continue praticando para melhorar seu raciocinio';
  }

  if (porcAcertos > porcErros){
    kd = 'Mais acertos do que erros';
  } else if( porcAcertos < porcErros){
    kd ='Mais erros do que acertos';
  } else if( porcAcertos == porcErros){
    kd = 'Mesma quantidade de acertos e erros';
  }
     

  
  }
  // deleayed code here 
  @override
  void initState() {
      
     
      super.initState();
      
      
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Desafio de multiplicação"),
      ),
      body: Padding(
            padding: EdgeInsets.fromLTRB(20, 15,20, 20),

            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
             
              GestureDetector(
                onTap: (){
                   setState(() {
              colorM = Color.fromRGBO(50,205,50,1);
              colorF = Color.fromRGBO(255,99,71,1);
              colorD = Color.fromRGBO(50,205,50,1);
              _current_difficult = "Fácil";
              min = 5;
              minaux = 1;
              max = 5;
              maxaux = 1;
              
              });
                },
              child:Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                   Radius.circular(40.0),
                  ),
              color: colorF,
                ),
                padding: EdgeInsets.all(10.0),
                child:
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child:  Text("Fácil",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      )
               
                  


             
          ),

              ),
              
          GestureDetector(
            onTap: (){
              setState(() {
              colorM = Color.fromRGBO(255,99,71,1);
              colorF = Color.fromRGBO(50,205,50,1);
              colorD = Color.fromRGBO(50,205,50,1);
              _current_difficult = "Médio";
              min = 10;
              minaux = 2;
              max = 11;
              maxaux = 4;
              
              });
              
            },
              child:Container(
              width: 100,
              height: 50,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.all(
                   Radius.circular(40.0),
                  ),
              color: colorM,
            ),
            padding: EdgeInsets.all(10.0),
            child: 
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child:  Text("Médio",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
               
                  


            
          ),

              ),
          GestureDetector(
             onTap: (){
                   setState(() {
              colorM = Color.fromRGBO(50,205,50,1);
              colorF = Color.fromRGBO(50,205,50,1);
              colorD = Color.fromRGBO(255,99,71,1);

              _current_difficult = "Díficil";
              min = 20;
              minaux = 5;
              max = 13;
              maxaux = 5;
              
              });
                },
              child:Container(

              width: 100,
              height: 50,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.all(
                   Radius.circular(40.0),
                  ),
              color: colorD,
            ),
            padding: EdgeInsets.all(10.0),
            child:
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child:  Text("Difícil",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
               
          
          ),

              ),

                  ],
                ),

              Padding(
                padding: EdgeInsets.only(top:30),
                child:Center(
                  child:  //CENTER OF START BUTTON
                      GestureDetector(
                      onTap: (){
                          setState(() {
                            
                            clock = 0;
                            startTimer();

                              if (_current_difficult == null){
                                showToast();
                                return;
                              }
                              bool = false;
                              generateMath();
                             
                             
                              
                      
                      });
                        },
                      child:Container(

                      width: 120,
                      height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                          ),
                      color: Colors.blue[300],
                    ),
                    padding: EdgeInsets.all(10.0),
                    child:
                          Padding(
                            padding: EdgeInsets.only(left: 7),
                            child:  Text("Começar",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                          )
                      
                  
                  ),

                    ), 
              ),
              ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: bool ?  Container() : Container(
      height: 500,
      decoration: BoxDecoration(
               borderRadius: BorderRadius.all(
                   Radius.circular(40.0),
        ),
        color: Colors.blue[300],
        boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0,255,255,1).withOpacity(0.38),
        spreadRadius: 10,
        blurRadius: 5,
        offset: Offset(0, 7), // changes position of shadow
      ),
    ],
        ),
      
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0,10,0,15),
          child: Center(
            
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:120),
              child: Icon(Icons.timer),
            ),
            Padding(
              padding: EdgeInsets.only(left:10),
              child:  Text(clock.toString(),
            style: TextStyle(
              color: Colors.yellow[300],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),)
            ),
            
           

            ]),
            )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,5,0,5),
            child: Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.all(

                   Radius.circular(10.0),
              ),
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
            ),

              child:Center(
                child: Text("Quanto é:",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ))
              ),

            ),
          ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(0,5,0,5),
            child: Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.all(

                   Radius.circular(10.0),
              ),
                color: Colors.yellow[100],
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
            ),

              child: Center(
                child: Text(a.toString()+"x"+b.toString(),
                  style: TextStyle(
                 
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    
                    ..color = Colors.black,
                ))
              ),

            ),
          ),
         
             ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context,index){

              return Center(
                child: RaisedButton(onPressed: (){
                  if (result == _results[index]){
                    acertos++;
                    generateMath();
                  } else{
                    erros++;
                  }
                },
                color: Colors.orangeAccent,
                child: Text(_results[index].toString())),

              );
            },
          ),
            SizedBox(height: 30,),
           RaisedButton(onPressed: (){

                 setDesempenho();
                 timer.cancel();
                 },
                color: Colors.redAccent,
                child: Text('Parar')
                ),
          
        ],

        
      ),

    ),
                ),
              ],
            ),
           
         
        ),
    ); 
  }
}