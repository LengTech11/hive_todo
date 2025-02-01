import 'package:flutter/material.dart';
import 'package:hive_todo/extensions/space_exs.dart';
import 'package:hive_todo/utils/app_colors.dart';
import 'package:hive_todo/utils/constanst.dart';
import 'package:hive_todo/utils/strings.dart';
import 'package:hive_todo/views/home/components/fab.dart';
import 'package:hive_todo/views/home/widget/task_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> testing = [];

  void addTask() {
    setState(() {
      testing.add(DateTime.now()
          .millisecondsSinceEpoch); // Adds a unique number as a task
    });
  }

  void removeTask(int index) {
    setState(() {
      testing.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,

      /// Floating Action Button
      floatingActionButton: Fab(onTap: addTask),

      /// Body
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            /// AppBar
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Progress Indicator
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),

                  25.w,

                  /// Top Level Task info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStr.mainTitle,
                        style: textTheme.displayLarge,
                      ),
                      3.h,
                      Text(
                        "${testing.length} of tasks",
                        style: textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),

            /// Divider
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),

            /// Tasks or Empty State
            Expanded(
              child: testing.isNotEmpty
                  ? ListView.builder(
                      itemCount: testing.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(testing[index].toString()),
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) => removeTask(index),
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.delete, color: Colors.grey),
                              8.w,
                              const Text(
                                AppStr.deleteTask,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          child: const TaskWidget(),
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeIn(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(
                              lottieURL,
                              animate: true,
                            ),
                          ),
                        ),
                        FadeInUp(
                          from: 30,
                          child: const Text(
                            AppStr.doneAllTask,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
