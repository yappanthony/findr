
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final user = supabase.auth.currentUser;
final fullName = user?.userMetadata?['full_name'];

class Home extends StatelessWidget {
  const Home({super.key, this.route, required String title});

  final String? route;
  final List<Map<String, dynamic>> gridData = const [
    {'text': 'Notebook', 'location': 'Library', 'image': 'assets/logo.png'},
    {'text': 'Phone', 'location': 'Cafeteria', 'image': 'assets/logo.png'},
    {'text': 'Ball', 'location': 'Gym', 'image': 'assets/image.png'},
    {'text': 'Fan', 'location': 'Office', 'image': 'assets/logo.png'},
    {'text': 'Water Bottle', 'location': 'Playground', 'image': 'assets/image.png'},
    {'text': 'Ball', 'location': 'Gym', 'image': 'assets/logo.png'},
    {'text': 'Fan', 'location': 'Office', 'image': 'assets/image.png'},
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(  
                "Lost & Found",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: const Color(0xFF96775A).withOpacity(.34)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: const Color(0xFF96775A).withOpacity(.34)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  isDense: true,
                ),
                ),
            ),
            Expanded(
                child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: .8, // Adjust this value to control the height
                ),
                itemCount: gridData.length,
                itemBuilder: (context, index) {
                  final item = gridData[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(route!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFF96775A).withOpacity(.34)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Stack(
                              children: [
                                ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                child: Image.asset(
                                'assets/image.png',
                                fit: BoxFit.cover,
                                width: 500,
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(1000, 48, 38, 29).withOpacity(.70),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                      child: Text(
                                        "Unclaimed",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              item['text'],
                              style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(1000, 48, 38, 29),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on, size: 12,color: Color.fromARGB(1000, 48, 38, 29),),
                                 Text(
                              item['location'],
                              style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(1000, 48, 38, 29),
                              ),
                            ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
