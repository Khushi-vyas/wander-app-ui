import 'package:flutter/material.dart';
import 'package:wander_app_ui/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CircleAvatar(backgroundColor: Colors.grey),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Your trips",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "CURRENT TRIP",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MyRoute(builder: (context) => DetailsPage()),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Hero(
                            tag: "background",
                            child: Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                // color: Colors.grey.shade800,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/trip.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
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
                                    //  style: TextStyle(color: Colors.white),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Hero(
                                  tag: "detail",
                                  child: Text(
                                    "Riding through \nthe lands of the legends",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 48),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Hero(
                              tag: "user1",
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              child: Hero(
                                tag: "user2",
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 56,
                              child: Hero(
                                tag: "user3",
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "PAST TRIPS",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                padding: EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "MAY 18,2023",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Roadtrip over Lorem ipsum",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(seconds: 1);
}
