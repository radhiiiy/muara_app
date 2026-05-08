import 'package:flutter/material.dart';
import 'package:muara_app/screens/favorite_screen.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Gambar Produk dengan sudut melengkung di kiri bawah
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?q=80&w=800',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 2. Tombol Kembali (Back Button) kustom
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),
            ),
          ),

          // 3. Detail Produk (Scrollable)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Memberi jarak agar konten teks mulai di bawah gambar
                SizedBox(height: MediaQuery.of(context).size.height * 0.58),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Minimal Stand',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF303030),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$ 50.00',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Counter Kuantitas
                          Row(
                            children: [
                              _buildCounterButton(Icons.remove, () {
                                if (quantity > 1) setState(() => quantity--);
                              }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              _buildCounterButton(Icons.add, () {
                                setState(() => quantity++);
                              }),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Bagian Rating
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          const Text(
                            '4.5',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '(50 reviews)',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // Deskripsi Produk
                      const Text(
                        'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is one of the best furniture in this store family. With very simple and minimal design and advanced materials.',
                        style: TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 15,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 100,
                      ), // Ruang tambahan agar tidak tertutup tombol bawah
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // 4. Tombol Add to Cart & Bookmark (Fixed di Bawah)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
        color: Colors.white,
        child: Row(
          children: [
            // Tombol Bookmark
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.bookmark_border,
                size: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            // Tombol Add to Cart
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritesPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF242424),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Tombol Tambah/Kurang
  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }
}
