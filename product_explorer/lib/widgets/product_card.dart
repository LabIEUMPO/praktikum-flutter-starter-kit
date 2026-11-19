import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double originalPrice;

  const ProductCard({
    super.key,
    required this.product,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = product.discountPercentage > 0;
    final isLowStock = product.stock > 0 && product.stock <= 5;

    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Frame Foto Produk (Rasio 3:4 + Badge Diskon Tajam)
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: AppTheme.surface,
                  padding: const EdgeInsets.all(AppTheme.spaceM),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          size: 36,
                          color: AppTheme.secondaryText,
                        ),
                      );
                    },
                  ),
                ),

                // Badge Diskon Merah Khas Uniqlo di pojok kiri atas
                if (hasDiscount)
                  Positioned(
                    top: AppTheme.spaceS,
                    left: AppTheme.spaceS,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spaceS,
                        vertical: AppTheme.spaceXS,
                      ),
                      color: AppTheme.saleAccent,
                      child: Text(
                        '-${product.discountPercentage.round()}%',
                        style: AppTheme.badgeLabelStyle,
                      ),
                    ),
                  ),

                // Indikator Stok Menipis di pojok bawah kiri
                if (isLowStock)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: AppTheme.primary.withValues(alpha: 0.85),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppTheme.spaceXS,
                        horizontal: AppTheme.spaceS,
                      ),
                      child: Text(
                        'LOW STOCK (${product.stock})',
                        textAlign: TextAlign.center,
                        style: AppTheme.badgeLabelStyle.copyWith(fontSize: 9),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: AppTheme.spaceS),

          // 2. Kategori & Rating
          Row(
            children: [
              Expanded(
                child: Text(
                  product.category.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.secondaryTextStyle.copyWith(
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Icon(Icons.star, size: 12, color: AppTheme.primaryText),
              const SizedBox(width: 2),
              Text(
                product.rating.toStringAsFixed(1),
                style: AppTheme.secondaryTextStyle.copyWith(
                  fontSize: 11,
                  color: AppTheme.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spaceXS),

          // 3. Judul Produk
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.productTitleStyle,
          ),

          const Spacer(),

          // 4. Baris Harga (Harga Promo + Harga Coret)
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: hasDiscount
                    ? AppTheme.salePriceStyle
                    : AppTheme.priceStyle,
              ),
              if (hasDiscount) ...[
                const SizedBox(width: AppTheme.spaceS),
                Text(
                  '\$${originalPrice.toStringAsFixed(2)}',
                  style: AppTheme.strikePriceStyle,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
