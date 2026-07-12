class NavigationBottomBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  NavigationBottomBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<NavigationBottomBarEntity> get navigationBottomBarItems => [
  NavigationBottomBarEntity(
    activeImage: 'assets/SVGs/active-home-icon.svg',
    inActiveImage: 'assets/SVGs/inactive-home-icon.svg',
    name: 'الرئيسية',
  ),

  NavigationBottomBarEntity(
    activeImage: 'assets/SVGs/active-products-icon.svg',
    inActiveImage: 'assets/SVGs/inactive-products-icon.svg',
    name: 'المنتجات',
  ),

  NavigationBottomBarEntity(
    activeImage: 'assets/SVGs/active-shopping-cart-icon.svg',
    inActiveImage: 'assets/SVGs/inactive-shopping-cart-icon.svg',
    name: 'سلة التسوق',
  ),

  NavigationBottomBarEntity(
    activeImage: 'assets/SVGs/active-profile-icon.svg',
    inActiveImage: 'assets/SVGs/inactive-profile-icon.svg',
    name: 'حسابي',
  ),
];
