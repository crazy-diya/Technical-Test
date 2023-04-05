import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/features/presentation/views/widgets/common_widgets.dart';
import 'package:technical_test/utils/app_colors.dart';
import 'package:technical_test/utils/app_constants.dart';
import 'package:technical_test/utils/navigation_routes.dart';

import '../../../../utils/app_images.dart';

class ProductDetailsView extends StatefulWidget {
  final Datum? datum;

  const ProductDetailsView({Key? key, this.datum}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  static List<String> list = <String>[];

  String? dropdownValue;
  int quantity = 0;

  @override
  void initState() {
    // TODO: implement initState
    list = widget.datum!.sizes;
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                SizedBox(
                  width: width * 0.6,
                  child: const Text(
                    "Welcome to Shop, Hava a Nice Day!",
                    maxLines: 5,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontBlackColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.kCartView),
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
            Container(
              width: width * 0.7,
              height: height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.datum!.mainImage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "SKU",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.sku,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Brand Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.brandName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Sizes",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style:
                              const TextStyle(color: AppColors.fontGrayColor),
                          onChanged: (String? value) {
                            print(value);
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.datum!.price.amount} ${widget.datum!.price.currency}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Stock Status",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.stockStatus,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Colour",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.datum!.colour,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontGrayColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeVer(10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.fontBlackColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Enter Quantity 1,2,3 ..",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                quantity = int.parse(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (quantity >= 1) {
                  Datum d = widget.datum!;
                  d.quantity = quantity;
                  d.size = dropdownValue;
                  AppConstants.cartList.add(d);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully Add item to the Cart!"),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please Enter Quantity!",
                        style: TextStyle(color: AppColors.redColor),
                      ),
                    ),
                  );
                }
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
                    "Add to Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.whiteColor,
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
}
