part of '../onboard_screen.dart';

class _Chips extends StatelessWidget {
  const _Chips();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.edgeInsets(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ChipCard(
                    title: '음료 라이브러리',
                    desc: '커피,차',
                    icon: Icon(Icons.coffee, color: AppColors.primary),
                  ),
                ),
                context.horizontalSpace(10),
                Expanded(
                  child: ChipCard(
                    title: '잔존량 계산',
                    desc: '반감기 기반 추적',
                    icon: Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          context.verticalSpace(10),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ChipCard(
                    title: '주월간 리포트',
                    desc: '패턴과 인사이트',
                    icon: Icon(
                      Icons.bar_chart_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                context.horizontalSpace(10),
                Expanded(
                  child: ChipCard(
                    title: '수면 영향',
                    desc: '취침 전 알림',
                    icon: Icon(CupertinoIcons.moon, color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
