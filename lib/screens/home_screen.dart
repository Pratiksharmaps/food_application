import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/screens/selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Food foodobj = Food();
  late String selectedCategory;
  int listindex = 1;
  @override
  void initState() {
    super.initState();
    selectedCategory = foodobj.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Welcome, Gokulraj',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'velit quto ut ut temporibus',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepOrange,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 6,
            )
          ],
        ),
        body: Row(children: [
          // -----------------------------------side menus option----------------------------
          // Category List
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: foodobj.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        listindex = index;
                        selectedCategory = foodobj.categories[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: selectedCategory == foodobj.categories[index]
                            ? const Color.fromARGB(255, 254, 83, 44)
                            : const Color.fromARGB(0, 196, 188, 188),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        foodobj.categories[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedCategory == foodobj.categories[index]
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select your $selectedCategory',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'Indian',
                      style: TextStyle(fontSize: 18, color: Colors.deepOrange),
                    ),
                    const SizedBox(height: 16),

                    // -------------------------------foodobj.dishes List----------------------------------------
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 19,
                        ),
                        itemCount: foodobj.dishes[selectedCategory]?.length,
                        itemBuilder: (context, index) {
                          //----------------------- card-------------------------------------------
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BillScreen(
                                            categoryindex: listindex,
                                            selecteddish: index ,
                                          )));
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SizedBox(
                                height: 280,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10)),
                                          image: DecorationImage(
                                            
                                            // image: AssetImage('assets/${foodItems[index].toLowerCase().replaceAll(' ', '_')}.png'),
                                            // using same image due to less time shown above my idea to display different images please consider it
                                            image: AssetImage(
                                              'assets/images/dalrice.jpeg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${foodobj.dishes[selectedCategory]?[index]}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8),
                                          ),
                                          const SizedBox(height: 1),
                                          Text(
                                            'Description of ${foodobj.dishes[selectedCategory]?[index]}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 6,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: Text(
                                              '\$10.35',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ))
        ]));
  }
}
