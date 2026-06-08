part of '../report_screen.dart';

class _Tabs extends ConsumerStatefulWidget {
  const _Tabs();

  @override
  ConsumerState<_Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<_Tabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabPage = ref.watch(tabPageProvider);
    return TabBar(
      onTap: (value) {
        final date = switch (value) {
          0 => ChartDate.week,
          1 => ChartDate.month,
          2 => ChartDate.year,
          _ => ChartDate.week,
        };
        ref.read(chartDateProvider.notifier).change(date);
        ref.read(tabPageProvider.notifier).move(value);
      },
      controller: _tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: context.edgeInsets(right: 14),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tabs: List.generate(3, (i) {
        return _TabLabel(
          label: ['이번 주', '이번 달', '연간'][i],
          isSelected: tabPage == i,
        );
      }),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary
            : AppColors.surface03.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Text(
        label,
        style: AppFonts.small.copyWith(
          color: isSelected ? AppColors.onPrimary : AppColors.primary,
        ),
      ),
    );
  }
}
