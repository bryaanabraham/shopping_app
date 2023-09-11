import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> filters = const [
    'Shop',
    'Shoes',
    'Clothes',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            'Reebok',
            style: TextStyle(fontFamily: 'Mottek', fontSize: 28),
          ),
        ),
        //safe area avoids the top and bottom area of the screen
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Shoes\nCollection',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //expanded takes the remaining space on the screen in the row or column
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: filters.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final filter = filters[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Chip(
                            backgroundColor:
                                const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                              color: Color.fromRGBO(215, 215, 215, 1),
                            ),
                            label: Text(filter),
                            labelStyle: const TextStyle(fontSize: 16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
