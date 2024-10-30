import 'package:flutter/material.dart';
import 'package:flutter_application_uts/menu.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  List<Menu> listMenu = [];

  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'Mountain Explorer',
        deskripsi: "A sturdy mountain bike for rough terrains.",
        harga: 4500000,
        gambar: 'MountainExplorer.png'),);

    listMenu.add(Menu(
        nama: 'City Cruiser',
        deskripsi: "A comfortable bike for urban commuting.",
        harga: 4500000,
        gambar: 'CityCruiser.png'),);

    listMenu.add(Menu(
        nama: 'Speedster Road Bike',
        deskripsi: "High-performance bike for road cycling.",
        harga: 4500000,
        gambar: 'SpeedsterRoadBike.png'),);

    listMenu.add(Menu(
        nama: 'Electric Commuter',
        deskripsi: "An electric bike for an effortless commute.",
        harga: 4500000,
        gambar: 'ElectricCommuter.png'),);
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Aplikasi Beli Sepeda')),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: listMenu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of items per row
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65, // Adjust the aspect ratio for item height
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/${listMenu[index].gambar}',
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listMenu[index].nama,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(listMenu[index].deskripsi),
                            Text("Rp. ${listMenu[index].harga}"),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              backgroundColor: Color(0xFF4BD2D0),
                              minimumSize: const Size.fromHeight(40.0), // Adjust height if needed
                            ),
                            child: const Text(
                              "Pesan",
                              style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
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
