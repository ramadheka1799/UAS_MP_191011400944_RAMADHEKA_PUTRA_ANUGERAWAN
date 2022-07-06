import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:artikel/providers/artikel_provider.dart';

class DetailArtikelScreen extends StatefulWidget {
  final String? title;
  final String? id;
  const DetailArtikelScreen({this.title, this.id, Key? key}) : super(key: key);

  @override
  State<DetailArtikelScreen> createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Consumer<ArtikelProvider>(
        builder: (context, artikelProvider, child) {
          return SingleChildScrollView(
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        "${artikelProvider.detailArtikelModel.data![0].image}"),
                    Text(
                      "${artikelProvider.detailArtikelModel.data![0].title}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Tanggal Terbit : ${artikelProvider.detailArtikelModel.data![0].createdAt}",
                    ),
                    // ),
                    // ),
                    SizedBox(height: 10.0),
                    Text(
                        "Deskripsi : ${artikelProvider.detailArtikelModel.data![0].description}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
