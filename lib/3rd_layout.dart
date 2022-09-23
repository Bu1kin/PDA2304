import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tretiy extends StatelessWidget {
  const Tretiy({super.key});

  @override
  Widget build(BuildContext context) {

    Widget topText = ListView.separated(
      padding: const EdgeInsets.fromLTRB(23, 15, 23, 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: const [
            Expanded(
              flex: 8,
              child: Text(
                'Meditate',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Icon(
                Icons.search
              ),
            ),
          ],
        );
      },
    );

    Widget listtest = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'All',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'Bible in a Year',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'Dailies',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'Minutes',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'November',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
      
    );

    Widget card = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.fromLTRB(24, 12, 24, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/sun_moon.png',
                  width: 344.0,
                  height: 150.0,
                  fit: BoxFit.scaleDown,
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 7),
                child: const Text(
                  'A Song of Moon',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: const Text(
                  'Start with the basics',
                  style: TextStyle(
                    fontSize: 17.5,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      size: 17,
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: 3),
                        child: const Text(
                          '9 sessions',
                            style: TextStyle(
                            color: Colors.grey,
                            ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                      child: const Text(
                        'Start >',
                          style: TextStyle(
                          color: Colors.grey,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget card12 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/birds.png',
                  width: 165.0,
                  height: 90.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 15, 3),
                child: const Text(
                  'The Sleep Hour',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 8),
                child: const Text(
                  'Ahsna Mukherjee',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      size: 12,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 3),
                      child: const Text(
                        '3 sessions',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Start >',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/luna.png',
                  width: 165.0,
                  height: 90.0,
                  fit: BoxFit.contain,
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 15, 3),
                child: const Text(
                  'Easy on the Mission',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 8),
                child: const Text(
                  'Peter Mach',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      size: 12,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 3),
                      child: const Text(
                        '5 minutes',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: const Text(
                        'Start >',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    Widget card34 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.fromLTRB(24, 15, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/world.png',
                  width: 165.0,
                  height: 90.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 15, 3),
                child: const Text(
                  'Relax with me',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 8),
                child: const Text(
                  'Amanda James',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      size: 12,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 3),
                      child: const Text(
                        '3 sessions',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Start >',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.fromLTRB(0, 15, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/birds.png',
                  width: 165.0,
                  height: 90.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 15, 3),
                child: const Text(
                  'Sun and Energy',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 8),
                child: const Text(
                  'Michael Hiu',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      size: 12,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 3),
                      child: const Text(
                        '5 minutes',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: const Text(
                        'Start >',
                          style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            topText,
            listtest,
            card,
            card12,
            card34,
          ],
        ),
      ),
    );
  }
}