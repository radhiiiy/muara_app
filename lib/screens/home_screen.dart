import 'package:flutter/material.dart';
import 'package:muara_app/screens/productDetail_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.search, color: Colors.grey, size: 28),
        title: Column(
          children: [
            Text(
              'MAKE HOME',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
                letterSpacing: 1.2,
              ),
            ),
            const Text(
              'BEAUTIFUL',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            onPressed: () {
              // Navigasi ke keranjang jika ada
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // 1. Kategori Horizontal
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCategoryItem(Icons.star, 'Popular', true),
                _buildCategoryItem(Icons.chair_outlined, 'Chair', false),
                _buildCategoryItem(Icons.table_restaurant_outlined, 'Table', false),
                _buildCategoryItem(Icons.weekend_outlined, 'Armchair', false),
                _buildCategoryItem(Icons.bed_outlined, 'Bed', false),
              ],
            ),
          ),
          
          // 2. Grid Produk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // Mengatur rasio lebar vs tinggi kartu
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildProductCard(
                    context,
                    'Black Simple Lamp',
                    '12.00',
                    'assets/images/Media.png',
                  ),
                  _buildProductCard(
                    context,
                    'Minimal Stand',
                    '25.00',
                    'assets/images/Media (1).png',
                  ),
                  _buildProductCard(
                    context,
                    'Coffee Chair',
                    '12.00',
                    'assets/images/Media (2).png',
                  ),
                  _buildProductCard(
                    context,
                    'Simple Desk',
                    '12.00',
                    'assets/images/Media (3).png',
                  ),
                ],
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, size: 28), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: ''),
        ],
      ),
    );
  }

  // Widget untuk Item Kategori
  Widget _buildCategoryItem(IconData icon, String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF242424) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Kartu Produk yang bisa di-tap
  Widget _buildProductCard(BuildContext context, String name, String price, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail produk
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailPage()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                // Gambar Produk
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Icon Keranjang Cepat
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Nama Produk
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF606060),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          // Harga Produk
          Text(
            '\$ $price',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}