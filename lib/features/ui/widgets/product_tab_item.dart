import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity product;

  ProductTabItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary300Opacity, width: 2)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 20.r,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            // todo add to favorite
                          },
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          iconSize: 30.r,
                          // Adjust icon size as needed
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text: product.title ?? '',
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(children: [
                  CustomTxt(
                    text: "EGP ${product.price}",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomTxt(
                    text: "EGP ${product.price! * 2}",
                    textStyle: AppStyles.regular11SalePrice
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ]),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    CustomTxt(
                      text: "Review (${product.ratingsAverage})",
                      fontSize: 12.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 25.sp,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                        ProductTabViewModel.get(context)
                            .addToCart(product.id ?? '');
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
