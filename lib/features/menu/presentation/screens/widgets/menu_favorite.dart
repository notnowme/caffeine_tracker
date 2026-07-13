part of '../menu_screen.dart';

class _Favorite extends StatelessWidget {
  const _Favorite();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.edgeInsets(horizontal: 10),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.star,
                color: AppColors.primary,
                size: context.h(12),
              ),
              context.horizontalSpace(4),
              Text(
                '즐겨찾기',
                style: AppFonts.tiny.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
        context.verticalSpace(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              context.horizontalSpace(10),
              _FavoriteItem(menu: '아메리카노', amount: 150),
              context.horizontalSpace(10),
              _FavoriteItem(menu: '라떼', amount: 150),
              context.horizontalSpace(10),
              _FavoriteItem(menu: '아메리카노', amount: 150),
              context.horizontalSpace(10),
              _FavoriteItem(menu: '아메리카노', amount: 150),
              context.horizontalSpace(10),
              _FavoriteItem(menu: '아메리카노', amount: 150),
              context.horizontalSpace(10),
            ],
          ),
        ),
      ],
    );
  }
}

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({required this.menu, required this.amount});

  final String menu;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(100),
      padding: context.edgeInsets(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: boxShadows(),
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(context.r(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.w(36),
            height: context.h(36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.r(12)),
              color: AppColors.surface02,
            ),
            child: Icon(Icons.coffee),
          ),
          context.verticalSpace(8),
          Text(
            menu,
            style: AppFonts.small.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            '${amount}mg',
            style: AppFonts.tiny.copyWith(color: AppColors.fg04),
          ),
        ],
      ),
    );
  }
}
