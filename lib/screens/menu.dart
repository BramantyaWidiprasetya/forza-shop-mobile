import 'package:flutter/material.dart';
import 'package:forza_shop/widgets/left_drawer.dart';
import 'package:forza_shop/widgets/product_card.dart';
import 'package:forza_shop/screens/productentry_form.dart';
import 'package:forza_shop/screens/list_productentry.dart';
import 'package:forza_shop/screens/login.dart';


class MyHomePage extends StatelessWidget {
  final String npm = '2306245604'; // NPM
  final String name = 'Ignasius Bramantya Widiprasetya'; // Nama
  final String className = 'PBP F'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag),
    ItemHomepage("Menambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forza Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Forza Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    switch (item.name) {
      case "Lihat Daftar Produk":
        backgroundColor = Colors.green;
        break;
      case "Menambah Produk":
        backgroundColor = Colors.yellow;
        break;
      case "Logout":
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
            if (item.name=="Menambah Produk") {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
              ));
            }
            else if (item.name=="Lihat Daftar Produk") {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ProductEntryPage(),
              ));
            }
            else if (item.name=="Logout") {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
              ));
            }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.black,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
