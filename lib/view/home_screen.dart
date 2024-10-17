import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home/home_cubit.dart';
import 'package:news_app/utils/dependency.dart';
import 'package:news_app/widget/page/home_all.dart';
import 'package:news_app/widget/page/home_favourite.dart';
import 'package:news_app/widget/page/home_saved.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(initialPage: 1);
  final ValueNotifier<int> _indexNotifier = ValueNotifier<int>(1);

  @override
  void initState() {
    homeCubit.getHomeState();
    _controller.addListener(() {
      if (_controller.page == _controller.page!.toInt()) {
        _indexNotifier.value = _controller.page!.toInt();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: BlocConsumer<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  listener: (context, state) {
                    state.maybeMap(
                      noInternetState: (value) {
                        _controller.jumpToPage(2);
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      internetAvailable: (value) {
                        return Text(value);
                      },
                      noInternetState: (value) {
                        return Text(value);
                      },
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  HomeAll(),
                  HomeFavourite(),
                  HomeSaved(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _indexNotifier,
          builder: (context, value, child) {
            return BottomNavigationBar(
              currentIndex: value,
              onTap: _controller.jumpToPage,
              items: const [
                BottomNavigationBarItem(
                  label: 'All',
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Favourites',
                  icon: Icon(
                    Icons.favorite,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Saved',
                  icon: Icon(
                    Icons.save,
                  ),
                ),
              ],
            );
          },
        ),);
  }
}
