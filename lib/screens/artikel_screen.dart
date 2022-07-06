import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:artikel/providers/artikel_provider.dart';
import 'package:artikel/screens/detail_artikel_screen.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({Key? key}) : super(key: key);

  @override
  State<ArtikelScreen> createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('191011400944_Ramadheka Putra Anugerawan'),
      ),
      body: Consumer<ArtikelProvider>(
        builder: (context, artikelProvider, child) {
          return ListView.builder(
            itemCount: artikelProvider.artikelModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailArtikelScreen(
                        title: artikelProvider.artikelModel.data![index].title,
                      ),
                    ),
                  );
                  artikelProvider.showDetailArtikel(
                      artikelProvider.artikelModel.data![index].id);
                },
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            "${artikelProvider.artikelModel.data![index].image}"),
                        Text(
                          "${artikelProvider.artikelModel.data![index].image}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "Judul Artikel : ${artikelProvider.artikelModel.data![index].title}"),
                        Text(
                            "Tanggal Artikel : ${artikelProvider.artikelModel.data![index].createdAt}"),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(18),
          );
        },
      ),
    );
  }
}
