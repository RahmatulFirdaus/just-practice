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
  var scrollController = ScrollController();

  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
          child: constraints.maxWidth < 600
              ? Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        MainImageSecondPage(),
                        ButtonBackFavorite(context),
                      ],
                    ),
                    Judul(),
                    Jarak(),
                    Information(),
                    Jarak(),
                    Detail(),
                    SlideImage()
                  ],
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 200),
                  child: Center(
                    child: Container(
                      // margin: const EdgeInsets.fromLTRB(300, 40, 300,
                      //     10),
                      // width: 1200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wisata Bandung",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainImageSecondPage(),
                                    Scrollbar(
                                      thumbVisibility: true,
                                      controller: scrollController,
                                      child: Container(
                                        width: 690,
                                        child: SlideImage(),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 700,
                                  height: 500,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0)
                                                  .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Judul(),
                                      Jarak(),
                                      Information(),
                                      Jarak(),
                                      Detail(),
                                      ButtonBackFavorite(context),
                                    ],
                                  ),
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                ));
    }));
  }

  Container SlideImage() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 200,
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: scrollController, // Controller yang sama untuk ListView dan Scrollbar
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          itemCount: widget.place.imageUrls.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal, // Scroll secara horizontal
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "${widget.place.imageUrls[index]}",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ClipRRect MainImageSecondPage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "${widget.place.imageUrls[0]}",
        width: 680,
        height: 480,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.warning),
      ),
    );
  }

  SafeArea ButtonBackFavorite(BuildContext context) {
    return SafeArea(
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
