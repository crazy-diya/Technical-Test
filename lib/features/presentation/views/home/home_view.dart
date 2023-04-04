import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:technical_test/features/presentation/views/home/widgets/product_list.dart';
import 'package:technical_test/utils/app_images.dart';
import 'package:technical_test/utils/app_strings.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/navigation_routes.dart';
import '../widgets/common_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withOpacity(0.8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width:250,
                        child: Text(
                          "Welcome to Shop, Hava a Nice Day!",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.kCartView);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppImages.cartImage,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizeVer(36),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.availableProduct,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18,color: AppColors.fontWhiteColor,),
                          ),
                          sizeVer(14),
                          const ProductList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
