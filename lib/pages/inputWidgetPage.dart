import 'package:flutter/material.dart';

class Inputwidgetpage extends StatefulWidget {
  const Inputwidgetpage({super.key});

  @override
  State<Inputwidgetpage> createState() => _InputwidgetpageState();
}

class _InputwidgetpageState extends State<Inputwidgetpage> {
  TextEditingController namaOrang = TextEditingController();
  TextEditingController hasilNamaOrang = TextEditingController();
  String? namaKota, bahasa;
  bool lampu = false;
  bool agree = false;

  @override
  void dispose() {
    namaOrang.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), // Tinggi AppBar
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.purple], // Warna gradien
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent, // Set transparan
              title: const Text(
                "PRACTICE",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldOnChanged(context),
              JarakHeight10(),
              TextFieldOnSubmitted(context),
              JarakHeight10(),
              TextFieldController(context),
              JarakHeight10(),
              SwitchWidgetTest(context),
              JarakHeight10(),
              RadioWidgetTest(),
              JarakHeight10(),
              CheckboxTest()
            ],
          ),
        ),
      ),
    );
  }

  Container CheckboxTest() {
    return Container(
              margin: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Agree/Disagree"),
                    leading: Checkbox(value: agree, onChanged: (value){
                      setState(() {
                        agree = value!;
                      });
                    }),
                  ),
                  Text("$agree")
                ],
              ),
            );
  }

  Container RadioWidgetTest() {
    return Container(
      margin: const EdgeInsets.fromLTRB(60, 20, 60, 20),
      child: Column(
        children: [
          const Text(
            "Radio",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: Radio(
                value: "Indonesian",
                groupValue: bahasa,
                onChanged: (value) {
                  setState(() {
                    bahasa = value;
                  });
                }),
            title: const Text("Indonesia"),
          ),
          ListTile(
            leading: Radio(
                value: "English",
                groupValue: bahasa,
                onChanged: (value) {
                  setState(() {
                    bahasa = value;
                  });
                }),
            title: const Text("English"),
          ),
          ListTile(
            leading: Radio(
                value: "Japanese",
                groupValue: bahasa,
                onChanged: (value) {
                  setState(() {
                    bahasa = value;
                  });
                }),
            title: const Text("Japanese"),
          ),
          Text("Bahasa yang dipilih : $bahasa")
        ],
      ),
    );
  }

  Container SwitchWidgetTest(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(60, 20, 60, 20),
      child: Column(
        children: [
          const Text(
            "Switch",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10,),
          Switch(
            value: lampu,
            onChanged: (value) {
              setState(() {
                lampu = value;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(lampu ? "Lampu Nyala" : "Lampu Mati"),
                  ),
                );
              });
            },
          ),
          OutlinedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(content: Text("$lampu"));
                    });
              },
              child: const Text("CLICK"))
        ],
      ),
    );
  }

  Container TextFieldController(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(60, 20, 60, 20),
      child: Column(
        children: [
          const Text(
            "Controller",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: namaOrang,
            decoration: InputDecoration(
                hintText: "Inputkan Nama",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                labelText: "Masukkan Nama Disini",
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(namaOrang.text),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.send)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: hasilNamaOrang,
            enabled: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          const Text(
            "Controller sama seperti OnChanged, tergantung kondisi mau pakai apa",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Container TextFieldOnSubmitted(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 20, top: 20),
      child: Column(
        children: [
          const Text(
            "OnSubmitted",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onSubmitted: (value) {
              setState(() {
                namaKota = value;
              });
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(content: Text("$namaKota"));
                        },
                      );
                    },
                    icon: const Icon(Icons.send)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          const Text(
            "Tidak menyimpan nilai saat terjadi perubahan atau setstate, kemungkinan setiap di submit baru berubah nilainya",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Container JarakHeight10() {
    return Container(
      color: Colors.black,
      height: 10,
    );
  }

  Container TextFieldOnChanged(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 20, top: 30),
      child: Column(
        children: [
          const Text(
            "OnChanged",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                namaKota = value;
              });
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("$namaKota"),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.send)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          const Text(
            "apapun yang diinputkan, akan langsung menjadi nilai pada variabel",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
