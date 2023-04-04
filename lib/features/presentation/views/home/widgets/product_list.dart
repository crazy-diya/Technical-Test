import 'package:flutter/material.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/utils/navigation_routes.dart';

import '../../../../../utils/app_colors.dart';
import '../../widgets/common_widgets.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, item) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.kProductDetails,
              arguments: ProductDetailsEntity(
                result: "ok",
                data: [
                  Datum(
                      id: "id",
                      sku: "sku",
                      name: "name",
                      brandName: "brandName",
                      mainImage: "mainImage",
                      price: Price(amount: "", currency: ""),
                      sizes: ["sizes"],
                      stockStatus: "stockStatus",
                      colour: "colour",
                      description: "description"),
                ],
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            elevation: 3,
            shadowColor: AppColors.secondaryColorLight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/media/ce1fbd10feb64bd39816d03a45fa5346_35892701_fr_puma_sc7.jpeg",
                          ),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  sizeHor(25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              "PUMA Soleil v2 scvdhvjhcvjhvh",
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.fontBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          sizeHor(10),
                          const Text(
                            "( 80.00 GBP )",
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: const Text(
                          "Simple and clean, the Soleil v2 exhibits iconic PUMA heritage.Synthetic upper with french piping embellishment and bold ghilles.Rubber outsole supplies durability and traction.",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.fontGrayColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "IN STOCK",
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      sizeVer(15),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            color: AppColors.blueColorLight),
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColors.secondaryColor,
                          size: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
