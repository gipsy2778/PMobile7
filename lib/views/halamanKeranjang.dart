import 'package:flutter/material.dart';
import 'package:pertemuan7/models/keranjang.dart';
import 'package:provider/provider.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Keranjang"), backgroundColor: Colors.amber),
      body: Consumer<Keranjang>(
        builder: (context, value, child) {
          if (value.isiKeranjang.isEmpty) {
            return const Center(child: Text('Data Kosong'));
          }
          return ListView.builder(
            itemCount: value.isiKeranjang.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(value.isiKeranjang[index].nama)),
          );
        },
      ),
    );
  }
}