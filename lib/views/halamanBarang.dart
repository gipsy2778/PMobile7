import 'package:flutter/material.dart';
import 'package:pertemuan7/models/barang.dart';
import 'package:pertemuan7/models/keranjang.dart';
import 'package:pertemuan7/views/halamanKeranjang.dart';
import 'package:provider/provider.dart';

class HalamanBarang extends StatelessWidget {
  const HalamanBarang({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Barang> dataBarang = [
      Barang('Sendal'),
      Barang('Sepatu'),
      Barang('Kaus Kaki'),
      Barang('Sabuk'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Daftar Barang'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Consumer<Keranjang>(
              builder: (context, value, child) {
                return Badge(
                  label: Text('${value.totalIsi}'),
                  isLabelVisible: value.totalIsi > 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanKeranjang(),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dataBarang.length,
        itemBuilder: (context, index) {
          final bar = dataBarang[index];
          return ListTile(
            title: Text(bar.nama),
            trailing: IconButton(
              onPressed: () {
                Provider.of<Keranjang>(context, listen: false).tambah(bar);
              },
              icon: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}