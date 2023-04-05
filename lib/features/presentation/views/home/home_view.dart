import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/core/services/dependency_injection.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/features/presentation/cubit/home/home_cubit.dart';
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
  final _cubit = injection<HomeCubit>();
  ProductDetailsEntity? productData;

  @override
  void initState() {
    // TODO: implement initState
    _cubit.getHomeData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlueColor.withOpacity(0.8),
      body: BlocProvider<HomeCubit>(
        create: (_) => _cubit,
        child: BlocListener<HomeCubit, HomeState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is LoadHomeDataSuccessState) {
              print("success");
              setState(() {
                productData = state.productDetailsEntity;
              });
            } else if (state is LoadHomeDataFailState) {
              print("fail");
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "It is an Error!",
                          style: TextStyle(fontSize: 20),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"))
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          child: SafeArea(
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
                            width: 250,
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
                            onTap: () {
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.fontWhiteColor,
                                ),
                              ),
                              sizeVer(14),
                              productData != null
                                  ? ProductList(
                                      productDetailsEntity: productData!,
                                    )
                                  : const Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.blueColor,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
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
        ),
      ),
    );
  }
}
