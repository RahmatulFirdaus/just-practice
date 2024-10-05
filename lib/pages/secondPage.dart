import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id_camp/models/modelWisataBandung.dart';

class Secondpage extends StatefulWidget {
  TourismPlace place;
  Secondpage({required this.place, super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  "${widget.place.imageUrls[0]}",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.warning),
                ),
              ),
              SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Favorite()
                ],
              )),
            ],
          ),
          Judul(),
          Jarak(),
          Information(),
          Jarak(),
          Detail(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 200,
            // color: Colors.blue,s
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: widget.place.imageUrls.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${widget.place.imageUrls[index]}",
                        fit: BoxFit.cover,
                      )),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    ));
  }

  Padding Detail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Text(
        "${widget.place.description}",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Container Information() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 60,
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 30,
              ),
              Text(
                "${widget.place.openDays}",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14)),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.timelapse,
                size: 30,
              ),
              Text("${widget.place.openTime}")
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.attach_money,
                size: 30,
              ),
              Text("${widget.place.ticketPrice}")
            ],
          )
        ],
      ),
    );
  }

  SizedBox Jarak() => const SizedBox(height: 10);

  Container Judul() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // color: Colors.red,
      height: 40,
      child: Text(
        "${widget.place.name}",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
