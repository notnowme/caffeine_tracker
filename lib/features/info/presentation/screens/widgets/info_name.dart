part of '../info_screen.dart';

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '닉네임',
          style: AppFonts.small.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        context.verticalSpace(8),
        Consumer(
          builder: (context, ref, child) {
            final initText = ref.watch(infoProvider.select((e) => e.name));
            final isError = initText.length < 3;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInput(
                  text: initText,
                  hintText: initText.isEmpty ? '닉네임' : '',
                  onChange: (value) {
                    if (value.isEmpty) {
                      return;
                    }
                    ref.read(infoProvider.notifier).updateName(value);
                  },
                ),
                context.verticalSpace(4),
                if (isError)
                  Text(
                    '세 글자 이상 작성해야 해요',
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
