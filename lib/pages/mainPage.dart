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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth <= 600
            ? PotraitContent()
            : constraints.maxWidth <= 1200
            ? LandscapeContent(index: 4)
            : LandscapeContent(index: 6);
      }),
    );
  }
}

class LandscapeContent extends StatelessWidget {
  double index;
  LandscapeContent({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: index.toInt(),
              shrinkWrap: true,
              crossAxisSpacing: index,
              mainAxisSpacing: index,
              children: TourismPlaceList.map((place) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Secondpage(place: place);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Image.network(
                              place.imageUrls[0],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0),
                          child: Text(
                            place.location,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
  }
}

class PotraitContent extends StatelessWidget {
  const PotraitContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        TourismPlace place = TourismPlaceList[index];
        return ContentCard(place: place);
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: TourismPlaceList.length,
    );
  }
}

class ContentCard extends StatefulWidget {
  const ContentCard({
    super.key,
    required this.place,
  });

  final TourismPlace place;

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Secondpage(place: widget.place);
          }));
        },
        child: Card(
            // color: Colors.red,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  widget.place.imageUrls[0],
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.place.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.place.location),
                    ],
                  )))
        ])));
  }
}
