part of '../settings_screen.dart';

class _Etc extends StatelessWidget {
  const _Etc();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '기타',
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
              _MyListItem(
                isFirst: true,
                title: '이용 약관',
                icon: Icons.info_outline_rounded,
              ),
              _MyListItem(
                isLast: true,
                title: '개인 정보 처리 방침',
                icon: CupertinoIcons.person_2_fill,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
