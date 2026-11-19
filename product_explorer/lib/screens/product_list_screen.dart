import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../core/theme/app_theme.dart';
import '../widgets/product_card.dart'; // Sesuaikan dengan path file AppTheme kamu

class ProductListScreen extends StatefulWidget {
  final ProductService productService;

  const ProductListScreen({super.key, required this.productService});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _productsFuture;
  String _searchQuery = '';
  String _selectedCategory = 'ALL';

  @override
  void initState() {
    super.initState();
    _productsFuture = widget.productService.getProducts();
  }

  /// Helper untuk menghitung harga sebelum diskon (untuk tampilan harga coret)
  double _getOriginalPrice(Product product) {
    if (product.discountPercentage <= 0) return product.price;
    return product.price / (1 - (product.discountPercentage / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          // 1. State Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.primary,
                strokeWidth: 2,
              ),
            );
          }

          // 2. State Error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spaceXL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 36,
                      color: AppTheme.secondaryText,
                    ),
                    const SizedBox(height: AppTheme.spaceM),
                    Text(
                      'Gagal memuat katalog produk',
                      style: AppTheme.sectionHeadingStyle,
                    ),
                    const SizedBox(height: AppTheme.spaceXS),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: AppTheme.secondaryTextStyle,
                    ),
                    const SizedBox(height: AppTheme.spaceL),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _productsFuture = widget.productService.getProducts();
                        });
                      },
                      child: const Text('COBA LAGI'),
                    ),
                  ],
                ),
              ),
            );
          }

          // 3. State Kosong dari API
          final allProducts = snapshot.data ?? [];
          if (allProducts.isEmpty) {
            return const Center(
              child: Text(
                'NO PRODUCTS AVAILABLE',
                style: AppTheme.sectionHeadingStyle,
              ),
            );
          }

          // Ambil daftar kategori unik secara otomatis dari data API
          final categories = [
            'ALL',
            ...allProducts.map((p) => p.category.toUpperCase()).toSet(),
          ];

          // Filter produk berdasarkan kategori & pencarian
          final filteredProducts = allProducts.where((product) {
            final matchesCategory =
                _selectedCategory == 'ALL' ||
                product.category.toUpperCase() == _selectedCategory;
            final matchesQuery =
                _searchQuery.isEmpty ||
                product.title.toLowerCase().contains(_searchQuery) ||
                product.category.toLowerCase().contains(_searchQuery);
            return matchesCategory && matchesQuery;
          }).toList();

          // 4. State Berhasil
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppTheme.spaceL,
                  AppTheme.spaceL,
                  AppTheme.spaceL,
                  AppTheme.spaceS,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.trim().toLowerCase();
                    });
                  },
                  style: AppTheme.productTitleStyle,
                  decoration: const InputDecoration(
                    hintText: 'SEARCH ITEMS, CATEGORIES...',
                    prefixIcon: Icon(Icons.search, size: 20),
                  ),
                ),
              ),

              // Horizontal Category Chips
              SizedBox(
                height: 44,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spaceL,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: AppTheme.spaceS),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == _selectedCategory;
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      showCheckmark: false,
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    );
                  },
                ),
              ),

              // Info Jumlah Produk (Editorial Subheader)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spaceL,
                  vertical: AppTheme.spaceS,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCategory,
                      style: AppTheme.sectionHeadingStyle,
                    ),
                    Text(
                      '${filteredProducts.length} ITEMS',
                      style: AppTheme.secondaryTextStyle.copyWith(
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Katalog Produk
              Expanded(
                child: filteredProducts.isEmpty
                    ? const Center(
                        child: Text(
                          'NO MATCHING ITEMS FOUND',
                          style: AppTheme.secondaryTextStyle,
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(AppTheme.spaceL),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppTheme.spaceM,
                              mainAxisSpacing: AppTheme.spaceXL,
                              childAspectRatio:
                                  0.50, // Proporsi ideal foto 3:4 + teks
                            ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ProductCard(
                            product: product,
                            originalPrice: _getOriginalPrice(product),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
