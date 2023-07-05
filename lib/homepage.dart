import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String eq='0';
  String res='0';
  String exp1="";

buttonPressed(String buttonText){
  setState(() {
    if(buttonText=='AC'){
      eq='0';
      res='0';
    }else if(buttonText=='C'){
      eq=eq.substring(0,eq.length-1);
      if(eq==''){
        eq='0';
      }
    }else if(buttonText=='='){
      exp1=eq;
      exp1=exp1.replaceAll('x', '*');
      try{
        Parser p= new Parser();
        Expression exp =p.parse(exp1);

        ContextModel cm=ContextModel();
        res='${exp.evaluate(EvaluationType.REAL, cm)}';
        res=res.substring(0,res.length-2);
      }catch(e){
        res='Error';
      }
    }else{
      if(eq=='0'){
        eq=buttonText;
      }else{
        eq=eq+buttonText;
      }
    }
  });
}

  Widget calcbutton(String btntxt, Color btnColor, Color txtcolor,double w){
    return GestureDetector(
    //onTap: buttonTapped,
    child: ElevatedButton(
      onPressed: () {
        buttonPressed(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    style: ElevatedButton.styleFrom(
    shape: CircleBorder(),
    padding: EdgeInsets.all(20),
  ),
  ),
  );
}
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
        backgroundColor: Colors.grey.shade700,
      ),
     
     body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      eq,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white54,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      //textToDisplay,
                      res,
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),

                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('AC', Colors.grey, Colors.red.shade700,w*0.2),// to add in all
              calcbutton('C', Colors.grey, Colors.red.shade700,w*0.2),
              calcbutton('%', Colors.grey, Colors.yellowAccent,w*0.2),
              calcbutton('/', Colors.grey, Colors.yellowAccent,w*0.2),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('7', Colors.grey, Colors.white,w*0.2),
              calcbutton('8', Colors.grey, Colors.white,w*0.2),
              calcbutton('9', Colors.grey, Colors.white,w*0.2),
              calcbutton('x', Colors.grey, Colors.yellowAccent,w*0.2),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('4', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('5', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('6', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('-', Colors.grey.shade800, Colors.yellowAccent,w*0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('1', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('2', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('3', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('+', Colors.grey.shade800, Colors.yellowAccent,w*0.2),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton('0', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('00', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('.', Colors.grey.shade800, Colors.white,w*0.2),
              calcbutton('=', Colors.grey.shade800, Colors.yellowAccent,w*0.2),
            ],
          ),
        ],
      ),
     ),
    );
  }
}