import 'package:flutter/material.dart';
import 'package:wander_app_ui/second_details_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        onVerticalDragEnd: (details) {
          // print(details);
          // print(details.velocity.pixelsPerSecond.dy);
          if (details.velocity.pixelsPerSecond.dy > 0) Navigator.pop(context);
          if (details.velocity.pixelsPerSecond.dy < 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(seconds: 1),
                reverseTransitionDuration: const Duration(seconds: 1),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SecondDetailsPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          }
        },
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: CircleAvatar(
          //       backgroundColor: Colors.grey.shade800,
          //       child: Icon(
          //         Icons.close,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          // extendBodyBehindAppBar: true,
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: "background",
                child: Image.asset(
                  "assets/trip.jpg",
                  fit: BoxFit.fill,
                  height: MediaQuery.sizeOf(context).height,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Hero(
                      tag: "date",
                      child: Text(
                        "MAY 18,2023",
                        // style: TextStyle(color: Colors.white),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Hero(
                      tag: "detail",
                      child: Text(
                        "Riding through \nthe lands of the legends",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      for (int i = 1; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Hero(
                            tag: "user$i",
                            child: FittedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 14,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
