import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: const couter()));
}

class couter extends StatefulWidget {
  const couter({super.key});

  @override
  State<couter> createState() => _couterState();
}

class _couterState extends State<couter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yibroaem Saman')),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$count', style: TextStyle(fontSize: 50)),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Text('+'),
                    ),
                    SizedBox(height: 6),
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          count--;
                        });
                      },
                      child: Text('-'),
                    ),
                    SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Text('+'),
                    ),
                    SizedBox(height: 6),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Text('+'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
