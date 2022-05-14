import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bidcdashboard/view/components/menu/menu_controller.dart';

class MMenuItem extends StatefulWidget {
  const MMenuItem({
    Key? key,
    required this.icon,
    required this.labelName,
    this.pageRoute,
    this.page,
    this.subMenuItems,
  }) : super(key: key);

  final IconData icon;
  final String labelName;
  final String? pageRoute;
  final Widget? page;
  final List<SubMenuItem>? subMenuItems;

  @override
  State<MMenuItem> createState() => _MMenuItemState();
}

class _MMenuItemState extends State<MMenuItem> {
  final _colorNotActiveContent = Colors.black54;
  final _colorActiveContent = Colors.black;

  final MenuController _menuController = Get.put(MenuController());

  bool _isMenuItemActive() {
    if (_menuController.activeMenuItem.value == widget.pageRoute!) return true;
    return false;
  }

  bool _isMenuItemClicked() {
    if (_menuController.clickedMenuItem.value == widget.pageRoute!) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                widget.subMenuItems == null
                    ? {
                        _menuController.activeSubMenuItem.value = "",
                        _menuController.clickedMenuItem.value = "",
                        _menuController.activeMenuItem.value = widget.pageRoute!
                      }
                    : {
                        _menuController.clickedMenuItem.value =
                            widget.pageRoute!
                      };
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(widget.icon,
                          color: _isMenuItemActive()
                              ? _colorActiveContent
                              : _colorNotActiveContent),
                      const SizedBox(width: 10),
                      Text(widget.labelName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _isMenuItemActive()
                                  ? _colorActiveContent
                                  : _colorNotActiveContent)),
                    ],
                  ),
                  if (widget.subMenuItems != null)
                    Icon(
                      _isMenuItemClicked()
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      color: _colorNotActiveContent,
                    )
                ],
              ),
            ),
          ),
          if (widget.subMenuItems != null)
            SizedBox(
              height: _isMenuItemClicked() ? null : 0,
              child: Column(
                children: [
                  for (var item in widget.subMenuItems!)
                    SubMenuItem(
                      labelName: item.labelName,
                      pageRoute: item.pageRoute,
                      pageParentRoute: item.pageParentRoute,
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SubMenuItem extends StatefulWidget {
  const SubMenuItem({
    Key? key,
    required this.labelName,
    this.pageRoute,
    this.pageParentRoute,
    this.page,
  }) : super(key: key);

  final String labelName;
  final String? pageRoute;
  final String? pageParentRoute;

  final Widget? page;

  @override
  State<SubMenuItem> createState() => _SubMenuItemState();
}

class _SubMenuItemState extends State<SubMenuItem> {
  final _colorNotActiveContent = Colors.black54;
  final _colorActiveContent = Colors.green;
  final MenuController _menuController = Get.put(MenuController());

  bool _isSubMenuItemActive() {
    if (_menuController.activeSubMenuItem.value == widget.pageRoute!) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        onPressed: () {
          _menuController.activeMenuItem.value = widget.pageParentRoute!;

          _menuController.activeSubMenuItem.value = widget.pageRoute!;
        },
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 36,
              child: VerticalDivider(
                color: _isSubMenuItemActive() ? Colors.red : Colors.red[100],
                thickness: 2,
                indent: 5,
                endIndent: 5,
                width: 20,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              widget.labelName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isSubMenuItemActive()
                      ? _colorActiveContent
                      : _colorNotActiveContent),
            ),
          ],
        ),
      ),
    );
  }
}

const homePageRoute = "homePageRoute";
const exchangePageRoute = "exchangePageRoute";
const stockFundPageRoute = "stockFundPageRoute";
const stockETFPageRoute = "stockETFPageRoute";
const indexPageRoute = "indexPageRoute";
const currencyPageRoute = "currencyPageRoute";
const mutualFundPageRoute = "mutualFundPageRoute";
const walletsPageRoute = "walletsPageRoute";
const cryptoPageRoute = "cryptoPageRoute";
const communityPageRoute = "communityPageRoute";
const helpSupportPageRoute = "helpSupportPageRoute";
const payPalPageRoute = "payPalPageRoute";
const staffManagementPageRoute = "staffManagementPageRoute";

Map menuItems = {
  "mainMenu": const [
    MMenuItem(
      icon: Icons.home_outlined,
      labelName: "Home",
      pageRoute: homePageRoute,
    ),
    MMenuItem(
      icon: Icons.people_outline,
      labelName: "Staff Management",
      pageRoute: staffManagementPageRoute,
    ),
    //   MMenuItem(
    //     icon: Icons.home_outlined,
    //     labelName: "Home",
    //     pageRoute: homePageRoute,
    //   ),
    //   MMenuItem(
    //     icon: Icons.currency_exchange_outlined,
    //     labelName: "Exchange",
    //     pageRoute: exchangePageRoute,
    //   ),
    //   MMenuItem(
    //     icon: Icons.home_max_outlined,
    //     labelName: "Stock & Fund",
    //     pageRoute: stockFundPageRoute,
    //     subMenuItems: [
    //       SubMenuItem(
    //         labelName: "Stock/ETF",
    //         pageRoute: stockETFPageRoute,
    //         pageParentRoute: stockFundPageRoute,
    //       ),
    //       SubMenuItem(
    //         labelName: "Index",
    //         pageRoute: indexPageRoute,
    //         pageParentRoute: stockFundPageRoute,
    //       ),
    //       SubMenuItem(
    //         labelName: "Currency",
    //         pageRoute: currencyPageRoute,
    //         pageParentRoute: stockFundPageRoute,
    //       ),
    //       SubMenuItem(
    //         labelName: "Mutual Fund",
    //         pageRoute: mutualFundPageRoute,
    //         pageParentRoute: stockFundPageRoute,
    //       ),
    //     ],
    //   ),
    //   MMenuItem(
    //     icon: Icons.wallet_giftcard_outlined,
    //     labelName: "Wallets",
    //     pageRoute: walletsPageRoute,
    //     subMenuItems: [
    //       SubMenuItem(
    //         labelName: "PayPal",
    //         pageRoute: payPalPageRoute,
    //         pageParentRoute: walletsPageRoute,
    //       ),
    //     ],
    //   ),
    //   MMenuItem(
    //     icon: Icons.money_outlined,
    //     labelName: "Crypto",
    //     pageRoute: cryptoPageRoute,
    //   ),
  ],
  "support": const [
    MMenuItem(
      icon: Icons.people_outline,
      labelName: "Community",
      pageRoute: communityPageRoute,
    ),
    MMenuItem(
      icon: Icons.help_outline,
      labelName: "Help & Support",
      pageRoute: helpSupportPageRoute,
    ),
  ],
};
