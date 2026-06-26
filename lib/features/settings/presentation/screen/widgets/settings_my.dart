part of '../settings_screen.dart';

class _My extends StatelessWidget {
  const _My();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '정보',
          style: AppFonts.small.copyWith(
            color: AppColors.fg04,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(10),
        Container(
          decoration: BoxDecoration(boxShadow: boxShadows()),
          child: Column(
            children: [
              BounceTapper(
                onTap: () {
                  context.pushNamed(InfoScreen.routeName, extra: true);
                },
                child: _MyListItem(
                  isFirst: true,
                  isLast: true,
                  title: '내 정보',
                  icon: CupertinoIcons.person_fill,
                ),
              ),
              // _MyListItem(
              //   isLast: true,
              //   title: '알림 설정',
              //   icon: CupertinoIcons.bell_fill,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  const _MyListItem({
    required this.title,
    required this.icon,
    this.isFirst = false,
    this.isLast = false,
    this.color = AppColors.primary,
  });

  final String title;
  final IconData icon;
  final bool isFirst;
  final bool isLast;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListItemCard(
      isFirst: isFirst,
      isLast: isLast,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: context.w(38),
                height: context.h(38),
                decoration: BoxDecoration(
                  color: AppColors.surface02,
                  borderRadius: BorderRadius.circular(context.r(12)),
                ),
                child: Icon(icon, color: color),
              ),
              context.horizontalSpace(14),
              Text(title, style: AppFonts.h3.copyWith(color: color)),
            ],
          ),
          Icon(
            Icons.chevron_right,
            size: context.h(24),
            color: AppColors.primary.withValues(alpha: 0.5),
          ),
        ],
      ),
    );
  }
}
