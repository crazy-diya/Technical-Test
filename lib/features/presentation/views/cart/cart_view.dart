import 'package:flutter/material.dart';
import 'package:technical_test/features/presentation/views/widgets/common_widgets.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              sizeHor(20),
              const Text(
                "Cart Item List",
                maxLines: 5,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontBlackColor,
                ),
              ),
              sizeHor(90),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AppConstants.cartList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    onTap: () {},
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    tileColor: AppColors.primaryColor,
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/ce1fbd10feb64bd39816d03a45fa5346_35892701_fr_puma_sc7.jpeg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    title: Text(
                      "KNINike Air Relentless 4 Mens Running ShoesTE",
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                    ),
                    subtitle: Text(
                      "100400.00 DGP",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.blackColor,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {}, icon: Icon(Icons.close_rounded)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 24),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "100400.00 DGP",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Successfully Pay!"),
                ),
              );
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.secondaryColor,
                ),
                child: const Text(
                  "Pay",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
