import 'package:flutter/material.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/utils/navigation_routes.dart';

import '../../../../../utils/app_colors.dart';
import '../../widgets/common_widgets.dart';

class ProductList extends StatefulWidget {
  ProductDetailsEntity productDetailsEntity;

  ProductList({Key? key, required this.productDetailsEntity}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.productDetailsEntity.data.length,
      itemBuilder: (context, item) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.kProductDetails,
              arguments: widget.productDetailsEntity.data[item],
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.productDetailsEntity.data[item].mainImage),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  ),
                  sizeHor(25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              widget.productDetailsEntity.data[item].name,
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.fontBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          sizeHor(10),
                          Text(
                            "(${widget.productDetailsEntity.data[item].price.amount} ${widget.productDetailsEntity.data[item].price.currency})",
                            style: const TextStyle(
                              color: AppColors.redColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.productDetailsEntity.data[item].description,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
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
                      Text(
                        widget.productDetailsEntity.data[item].stockStatus,
                        style: const TextStyle(
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
