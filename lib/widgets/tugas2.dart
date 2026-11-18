import 'package:flutter/material.dart';

const Color _primaryBlue = Color(0xFF2F6BFF);
const Color _pageBackground = Color(0xFFF7F8FC);

void _noop() {}

class Tugas2Widget extends StatelessWidget {
  const Tugas2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: _primaryBlue,
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _StoreHeader(),
              const SizedBox(height: 22),
              const _GreetingRow(),
              const SizedBox(height: 16),
              const _SearchRow(),
              const SizedBox(height: 18),
              const _PromoBanner(),
              const SizedBox(height: 24),
              const _SectionHeader(title: 'Kategori Produk'),
              const SizedBox(height: 14),
              const _CategoryRow(),
              const SizedBox(height: 24),
              const _SectionHeader(title: 'Produk Populer'),
              const SizedBox(height: 14),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) =>
                    _ProductCard(product: _products[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreHeader extends StatelessWidget {
  const _StoreHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _primaryBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TUGAS 2 - SijaMart',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141B2D),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Belanja mudah dan hemat',
                style: TextStyle(fontSize: 10.5, color: Color(0xFF8A92A6)),
              ),
            ],
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkResponse(
            onTap: _noop,
            splashFactory: InkRipple.splashFactory,
            containedInkWell: true,
            radius: 22,
            child: SizedBox(
              width: 34,
              height: 40,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 26,
                      color: Color(0xFF141B2D),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE53935),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GreetingRow extends StatelessWidget {
  const _GreetingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat pagi,',
                style: TextStyle(fontSize: 12, color: Color(0xFF8A92A6)),
              ),
              SizedBox(height: 2),
              Text(
                'Giovanni 👋',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF141B2D),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Mau belanja apa hari ini?',
                style: TextStyle(fontSize: 11, color: Color(0xFF8A92A6)),
              ),
            ],
          ),
        ),
        Material(
          color: const Color(0xFFDCEAFE),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: _noop,
            splashFactory: InkRipple.splashFactory,
            child: const SizedBox(
              width: 46,
              height: 46,
              child: Icon(
                Icons.person_outline_rounded,
                color: _primaryBlue,
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchRow extends StatelessWidget {
  const _SearchRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: _noop,
              splashFactory: InkRipple.splashFactory,
              child: Container(
                height: 46,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      size: 20,
                      color: Color(0xFF8A92A6),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Cari produk yang kamu inginkan...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Color(0xFF8A92A6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Material(
          color: _primaryBlue,
          borderRadius: BorderRadius.circular(14),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: _noop,
            splashFactory: InkRipple.splashFactory,
            child: const SizedBox(
              width: 46,
              height: 46,
              child: Icon(Icons.tune_rounded, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _noop,
      child: Container(
        height: 146,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2C65C8), Color(0xFF317BD3)],
          ),
        ),
        child: Stack(
          children: [
            // Large outer halo.
            Positioned(
              top: -18,
              right: -36,
              child: Container(
                width: 210,
                height: 210,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            // Brighter inner halo behind the cart icon.
            Positioned(
              top: 18,
              right: -2,
              child: Container(
                width: 138,
                height: 138,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.14),
                ),
                child: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 62,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6A821),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'HOT DEAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 18, 110, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PROMO SPESIAL',
                    style: TextStyle(
                      color: Color(0xFFD7E5FA),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Diskon Hingga\n50%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      height: 1.14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Belanja sekarang dan hemat!',
                    style: TextStyle(color: Color(0xFFD7E5FA), fontSize: 10.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF141B2D),
          ),
        ),
        const Spacer(),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: _noop,
            splashFactory: InkRipple.splashFactory,
            borderRadius: BorderRadius.circular(8),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'Lihat semua',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: _primaryBlue,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Category {
  const _Category({
    required this.label,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String label;
  final IconData icon;
  final Color background;
  final Color foreground;
}

const List<_Category> _categories = [
  _Category(
    label: 'Makanan',
    icon: Icons.restaurant_rounded,
    background: Color(0xFFFDF1D6),
    foreground: Color(0xFFF2A93B),
  ),
  _Category(
    label: 'Minuman',
    icon: Icons.local_cafe_rounded,
    background: Color(0xFFF1EBE6),
    foreground: Color(0xFF8D6E63),
  ),
  _Category(
    label: 'Elektronik',
    icon: Icons.laptop_mac_rounded,
    background: Color(0xFFE1F0FE),
    foreground: Color(0xFF3B82F6),
  ),
  _Category(
    label: 'Fashion',
    icon: Icons.checkroom_rounded,
    background: Color(0xFFF3E7FB),
    foreground: Color(0xFFA855C9),
  ),
];

class _CategoryRow extends StatelessWidget {
  const _CategoryRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final category in _categories)
          Expanded(
            child: Column(
              children: [
                Material(
                  color: category.background,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: _noop,
                    splashFactory: InkRipple.splashFactory,
                    child: SizedBox(
                      width: 58,
                      height: 58,
                      child: Icon(
                        category.icon,
                        color: category.foreground,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.label,
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B5468),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Product {
  const _Product({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.icon,
    required this.background,
    required this.foreground,
  });

  final String name;
  final String price;
  final String oldPrice;
  final int discount;
  final IconData icon;
  final Color background;
  final Color foreground;
}

const List<_Product> _products = [
  _Product(
    name: 'Indomie Goreng',
    price: 'Rp3.500',
    oldPrice: 'Rp4.000',
    discount: 12,
    icon: Icons.ramen_dining_rounded,
    background: Color(0xFFFDF1D6),
    foreground: Color(0xFFF29B38),
  ),
  _Product(
    name: 'Susu Fresh Milk',
    price: 'Rp8.000',
    oldPrice: 'Rp10.700',
    discount: 25,
    icon: Icons.local_drink_rounded,
    background: Color(0xFFE1F0FE),
    foreground: Color(0xFF3B82F6),
  ),
  _Product(
    name: 'Roti Cokelat',
    price: 'Rp6.000',
    oldPrice: 'Rp7.000',
    discount: 14,
    icon: Icons.bakery_dining_rounded,
    background: Color(0xFFF5EDE7),
    foreground: Color(0xFF8D6E63),
  ),
  _Product(
    name: 'Keripik Kentang',
    price: 'Rp9.000',
    oldPrice: 'Rp13.900',
    discount: 35,
    icon: Icons.lunch_dining_rounded,
    background: Color(0xFFFCE3DE),
    foreground: Color(0xFFEF6C57),
  ),
];

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final _Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: _noop,
          splashFactory: InkRipple.splashFactory,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: product.background,
                      child: Center(
                        child: Icon(
                          product.icon,
                          size: 54,
                          color: product.foreground,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE53935),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '-${product.discount}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: _noop,
                        tooltip: 'Simpan ke wishlist',
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          size: 18,
                          color: Color(0xFFE53935),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 32,
                          height: 32,
                        ),
                        splashRadius: 18,
                        style: IconButton.styleFrom(
                          splashFactory: InkRipple.splashFactory,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF141B2D),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product.oldPrice,
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: Color(0xFF9AA2B4),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.price,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF141B2D),
                            ),
                          ),
                        ),
                        Material(
                          color: _primaryBlue,
                          borderRadius: BorderRadius.circular(8),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: _noop,
                            splashFactory: InkRipple.splashFactory,
                            child: const SizedBox(
                              width: 26,
                              height: 26,
                              child: Icon(
                                Icons.add_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
