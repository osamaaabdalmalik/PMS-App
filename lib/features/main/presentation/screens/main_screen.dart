import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:consultations_app/features/main/presentation/screens/home_tab.dart';
import 'package:consultations_app/features/main/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> tabs = [
    const HomeTab(),
    const HomeTab(),
    const HomeTab(),
    const HomeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: context.read<MainCubit>().pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: tabs,
          ),
          bottomNavigationBar: BottomNavbar(
            currentTab: context.read<MainCubit>().currentTab,
            changeCurrentTab: context.read<MainCubit>().changeCurrentTab,
          ),
        );
      },
    );
  }
}
