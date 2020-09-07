import 'package:flutter/material.dart';
import 'quoteBrain.dart';

void main() {
  runApp(RamdomQuoteGenerator());
}

class RamdomQuoteGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuotePage(title: 'Random Quote Generator'),
    );
  }
}

QuoteBrain randomQuotes = QuoteBrain();

class QuotePage extends StatefulWidget {
  QuotePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  randomQuotes.getQuoteText(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Source Sans Pro",
                  ),
                ),
              ),
              Center(
                child: Text(
                  randomQuotes.getQuoteAuthor(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Satisfy",
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        randomQuotes.nextQuote();
                      });
                    },
                    color: Colors.blue.shade900,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Get Random Quote",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
