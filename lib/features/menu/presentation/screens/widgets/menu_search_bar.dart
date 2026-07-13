part of '../menu_screen.dart';

class _Searchbar extends StatelessWidget {
  const _Searchbar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.edgeInsets(horizontal: 10),
      child: Consumer(
        builder: (_, ref, child) {
          return TextInput(
            showIcon: true,
            hintText: '아메리카노, 라떼, 콜드브루...',
            onChange: (value) {
              ref.read(searchTextProvider.notifier).change(value);
            },
          );
        },
      ),
    );
  }
}
