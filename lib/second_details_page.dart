import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SecondDetailsPage extends StatelessWidget {
  const SecondDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          // print(details);
          // print(details.velocity.pixelsPerSecond.dy);
          if (details.velocity.pixelsPerSecond.dy > 0) Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 16),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Hero(
                  tag: "detail",
                  child: Text(
                    "Riding through \nthe lands of the legends",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 8),
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
                              //  color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 14,
                                  ),
                                  SizedBox(width: 8),
                                  Text("Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 240,
                        ),
                      ),
                  ],
                ),
              ).animate().moveY(begin: 100, end: 0, duration: 1.seconds),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "TRIP BOARD",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ).animate().moveY(begin: 100, end: 0, duration: 1.seconds),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "What a trip! Thanks for all the memories. What's next?",
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16);
                },
              ).animate().moveY(begin: 100, end: 0, duration: 1.seconds),
            ],
          ),
        ),
      ),
    );
  }
}
