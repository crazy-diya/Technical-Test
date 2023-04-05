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
  double tot = 0.00;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    AppConstants.cartList.forEach((element) {
      setState(() {
        tot = (double.parse(element.price.amount) * element.quantity!) + tot;
      });
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          sizeVer(20),
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                AppConstants.cartList[index].mainImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    title: Text(
                      AppConstants.cartList[index].name,
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
                      "${AppConstants.cartList[index]!.price.amount} ${AppConstants.cartList[index].price.currency} * ${AppConstants.cartList[index].quantity}",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.blackColor,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          AppConstants.cartList.remove(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.close_rounded)),
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
                "Total is :  ${tot.toString()}",
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
