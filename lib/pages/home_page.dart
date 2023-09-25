import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:party_flutter/model/category_model.dart';
import 'package:party_flutter/model/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;
  @override
  void initState() {
    super.initState();
    Categories.insert(
        0,
        CategoryModel()
          ..name = 'All Categories'
          ..id = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/images/avt4.jpg'),
                ),
                const SizedBox(width: 12.0),
                const Expanded(child: Text('Hi Rache 😶‍🌫️🖐️')),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Stack(
                    children: [
                      Icon(Icons.notification_important_rounded),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: CircleAvatar(
                          radius: 3.0,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18.0),
          SizedBox(
            height: 40.0,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: categoryIndex == index
                              ? Colors.black
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.white.withOpacity(0.2))
                          ]),
                      child: Text(
                        Categories[index].name ?? '',
                        style: TextStyle(
                            color: categoryIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12.0);
                },
                itemCount: Categories.length),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(alignment: Alignment.centerLeft, child: Text('February 2023')),
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: ListView.separated(  
                itemBuilder: (context, index) {
                  return Container(
                     padding: EdgeInsets.all(10.0),
                     margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16.0),boxShadow:[BoxShadow(color: Colors.grey)] ),
                    child: Row(
                    
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            events[index].avt ?? '',
                            width: 65.0,
                            height: 65.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              events[index].category?.name ?? '',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(events[index].title??'', style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w600, color: Colors.black ),),
                            Text(events[index].date??'',style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w600, color: Colors.grey )),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.0,
                  );
                },
                itemCount: events.length),
          ),
        ],
      ),
    );
  }
}
