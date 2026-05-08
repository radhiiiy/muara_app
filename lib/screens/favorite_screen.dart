import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk list favorit
    final List<Map<String, String>> favoriteItems = [
      {'name': 'Minimal Stand', 'price': '25.00', 'image': 'https://images.unsplash.com/photo-1581539250439-c96689b516dd?q=80&w=200'},
      {'name': 'Minimal Stand', 'price': '25.00', 'image': 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=200'},
      {'name': 'Minimal Stand', 'price': '25.00', 'image': 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=200'},
      {'name': 'Minimal Stand', 'price': '25.00', 'image': 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?q=80&w=200'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.search, color: Colors.black),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // 1. List Item Favorit
          ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 100), // Padding bawah ekstra untuk tombol
            itemCount: favoriteItems.length,
            separatorBuilder: (context, index) => const Divider(height: 30),
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Produk
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      item['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Info Produk
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$ ${item['price']}',
                          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Tombol Aksi (Hapus & Tambah ke Keranjang)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.cancel_outlined, color: Colors.black, size: 22),
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.shopping_bag_outlined, size: 20),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          // 2. Tombol Add all to my cart (Positioned di bawah)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF242424),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Add all to my cart',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
      // 3. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1, // Highlight icon bookmark
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}