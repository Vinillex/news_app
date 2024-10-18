import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/home/home_cubit.dart';
import 'package:news_app/view/settings_screen.dart';
import 'package:news_app/widget/custom_widget/weather_card.dart';
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

  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = GetIt.I<HomeCubit>();
    _homeCubit.getHomeState();
    _controller.addListener(() {
      if (_controller.page == _controller.page!.toInt()) {
        _indexNotifier.value = _controller.page!.toInt();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _homeCubit,
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
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: WeatherCard(),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SettingsScreen();
                                      },
                                    ),
                                  ).then((value) {
                                    _homeCubit.getRefreshHomeState();
                                  });
                                },
                                icon: const Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ),
                      ],
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
              ),
            );
          },
          noInternetState: (value) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: WeatherCard(),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SettingsScreen();
                                      },
                                    ),
                                  ).then((value) {
                                    _homeCubit.getRefreshHomeState();
                                  });
                                },
                                icon: const Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ),
                      ],
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
              ),
            );
          },
          loading: () {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
