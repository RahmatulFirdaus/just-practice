import 'package:flutter/material.dart';
import 'package:id_camp/models/modelWisataBandung.dart';
import 'package:id_camp/pages/secondPage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 197, 255),
        title: const Text("Wisata Bandung"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          TourismPlace place = TourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Secondpage(place: place);
              }));
            },
            child: Card(
                // color: Colors.red,
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Image.network(place.imageUrls[0], width: 150, height: 100, fit: BoxFit.cover,)),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(place.location),
                      ],
            )))])));
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: TourismPlaceList.length,
        ),
      );
  }
}
