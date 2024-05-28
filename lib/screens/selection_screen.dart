// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/providers/food_provider.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/utils/alert_dialog.dart';
class BillScreen extends StatefulWidget {
  final int? categoryindex;
  final int? selecteddish;
  const BillScreen({super.key, this.categoryindex, this.selecteddish});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  Food foodobj = Food();
  late String selectedcategory;
  late String? selecteddish;
  String? selectedRice;
  String? selectedDal;
  @override
  void initState() {
    super.initState();
    selectedcategory = foodobj.categories[widget.categoryindex ?? 1];
    selecteddish = foodobj.dishes[selectedcategory]?[widget.selecteddish ?? 1];
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
                  fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold),
            )
          ],
        ),
        // backgroundColor: Colors.deepOrange,
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
          const SizedBox(width: 6)
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: foodobj.categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: selectedcategory == foodobj.categories[index]
                          ? const Color.fromARGB(255, 254, 83, 44)
                          : const Color.fromARGB(0, 196, 188, 188),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      foodobj.categories[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedcategory == foodobj.categories[index]
                              ? Colors.white
                              : Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
          // Main content area
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select your $selectedcategory',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),
                    // Featured item
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Home Style Favourites',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$selecteddish',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Classic Indian Comfort',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '\$10.35',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'A quintessential Indian comfort food pairing, featuring aromatic basmati rice served with flavorful lentil dal. A hearty, wholesome dish that satisfies the soul with every bite.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    //---------------------- Options selection----------------------------------------
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Choose your rice',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                leading: Radio(
                                    value: 'Jeera Rice',
                                    groupValue: selectedRice,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRice = value;
                                      });
                                    }),
                                title: const Text('Ghee Rice'),
                                trailing: const Text('\$4.70'),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 'Ghee Rice',
                                  groupValue: selectedRice,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRice = value;
                                    });
                                  },
                                ),
                                title: const Text('Ghee Rice'),
                                trailing: const Text('\$4.70'),
                              ),
                              const SizedBox(height: 16),
                              // -------------------------------------------------------
                              const Text(
                                'Choose your Dal',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 'Dal Tadka',
                                  groupValue: selectedDal,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDal = value;
                                    });
                                  },
                                ),
                                title:const  Text('Dal Tadka'),
                                trailing: const Text('\$2.30'),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 'Masala Dal',
                                  groupValue: selectedDal,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDal = value;
                                    });
                                  },
                                ),
                                title:const  Text('Masala Dal'),
                                trailing:const  Text('\$4.70'),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 'Lasooni Dal',
                                  groupValue: selectedDal,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDal = value;
                                    });
                                  },
                                ),
                                title: const Text('Lasooni Dal'),
                                trailing: const Text('\$2.50'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final foodProvider = FoodProvider();
                                  // ----------Save selections to database using FoodProvider methods---------------
                                  await foodProvider.saveSelection(
                                    selectedRice: selectedRice,
                                    selectedDal: selectedDal,
                                  );
                                  showAlertDialogBox(context, 'Selection saved',
                                      'Saved to Database', () {
                                    hideProgressDialog(context);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  });
                                },
                                child: const Text('Save Selection'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
