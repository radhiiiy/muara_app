import 'package:flutter/material.dart';

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
            Text('MAKE HOME', 
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14, letterSpacing: 1.2)),
            const Text('BEAUTIFUL', 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // 1. Kategori Horizontal
          SizedBox(
            height: 80,
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
                childAspectRatio: 0.65,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildProductCard('Black Simple Lamp', '12.00', 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?q=80&w=500&auto=format&fit=crop'),
                  _buildProductCard('Minimal Stand', '25.00', 'https://images.unsplash.com/photo-1581539250439-c96689b516dd?q=80&w=500&auto=format&fit=crop'),
                  _buildProductCard('Coffee Chair', '12.00', 'https://images.unsplash.com/photo-1592078615290-033ee584e267?q=80&w=500&auto=format&fit=crop'),
                  _buildProductCard('Simple Desk', '12.00', 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?q=80&w=500&auto=format&fit=crop'),
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
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  // Widget Helper untuk Item Kategori
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
            child: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(title, style: TextStyle(color: isSelected ? Colors.black : Colors.grey, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  // Widget Helper untuk Kartu Produk
  Widget _buildProductCard(String name, String price, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(name, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text('\$ $price', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}