import 'package:e_commerce_app/common/widgets/brandtitlewithverfiedicon.dart';
import 'package:e_commerce_app/common/widgets/circular_image.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/common/widgets/tabar.dart';
import 'package:e_commerce_app/common/widgets/tbrand_card.dart';
import 'package:e_commerce_app/common/widgets/tcartcounter_icon.dart';
import 'package:e_commerce_app/common/widgets/tcategory_tab.dart';
import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/common/widgets/tsearchcontainer.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/brand_show_case.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/homeappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}, iconColor: TColors.black)
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerboxscrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 440,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(
                      TSizes.defaultSpace,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 4,
                        ),
                        const TSearchContainer(
                          text: 'Serch in Store',
                          showbackground: false,
                          showborder: true,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        TSectionHeader(
                          title: 'Feautered Brands',
                          onpressed: () {},
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),
                        TGridLayout(
                            itemcount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(
                                showborder: true,
                              );
                            })
                      ],
                    ),
                  ),
                  bottom: const TTabBar(tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Cloths'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ]),
                )
              ];
            },
            body: const TabBarView(children: [
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
            ])),
      ),
    );
  }
}
