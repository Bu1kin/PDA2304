import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Vtoroy extends StatelessWidget {
  const Vtoroy({super.key});

  @override
  Widget build(BuildContext context) {

    //Тексты
    Widget description = Container(
      padding: const EdgeInsets.all(25.0),
      
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: const Text(
                    'Peter Mach',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: const Text(
                    'Mind Deep Relax',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: 25.0),
                    child: const Text(
                      'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                      ),

                      Text(
                        'Play Next Session',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final List<MaterialColor> colors = [Colors.blue, Colors.teal, Colors.orange];
    final List<String> names = ['Sweet Memories', 'A Day Dream', 'Mind Explore'];

    Widget songs = ListView.separated(
      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {

        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: const Icon(
                Icons.play_arrow_outlined,
                color: Colors.white,
              ),
            ),

            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      names[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: const Text(
                      'December 29 Pre-Launch',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const Expanded(
              flex: 1,
              child: Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ),
          ], 
        );
      },
    );

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Image.asset(
                'assets/images/man_stand.png',
                width: 500.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
            ),
            description,
            songs
          ],
        ),
      ),
    );
  }
}