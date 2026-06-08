part of '../info_screen.dart';

class _Weight extends StatelessWidget {
  const _Weight();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '체중',
              style: AppFonts.small.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        context.verticalSpace(8),
        Consumer(
          builder: (context, ref, child) {
            final initWeight = ref.watch(infoProvider.select((e) => e.weight));
            final isError = initWeight < 30;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInput(
                  text: initWeight.toString(),
                  isNumber: true,
                  hintText: '45',
                  onChange: (value) {
                    final age = double.tryParse(value);
                    if (age != null) {
                      ref.read(infoProvider.notifier).updateWeight(age);
                    }
                  },
                ),
                context.verticalSpace(4),
                if (isError)
                  Text(
                    '너무 작은 것 같아요',
                    style: AppFonts.tiny.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
