import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0).copyWith(right: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Explore",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ac leo eu justo feugiat interdum.",
                style: GoogleFonts.poppins()),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 72,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  itemBuilder: (context, index) {
                    var logo = [
                      "gdsc.png",
                      "kalakrithi.png",
                      "gstudio.png",
                      "eclub.png",
                      "gitam-club.png"
                    ];
                    return ClipOval(
                      child: Container(
                        height: 72,
                        width: 72,
                        color:
                            Color(0xFF981F2B).withOpacity(index < 3 ? 1 : 0.3),
                        child: Center(
                          child: Container(
                            height: 66,
                            width: 66,
                            decoration: BoxDecoration(
                              color: Color(0xFF981F2B)
                                  .withOpacity(index < 3 ? 1 : 0.3),
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                            ),
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/${logo[index]}",
                                  height: index == 4 ? 64 : 32,
                                  width: index == 4 ? 64 : 32,
                                  color: Colors.white
                                      .withOpacity(index < 3 ? 1 : 0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, _) {
                    return SizedBox(
                      width: 24,
                    );
                  },
                  itemCount: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var title = [
                      "IWD'23",
                      "Ethnic Day",
                      "Session on DS",
                      "Sem Examinations",
                      "Flutter Workshop"
                    ];
                    var images = [
                      "https://media.licdn.com/dms/image/D5612AQFIxrQlj3WFVw/article-cover_image-shrink_600_2000/0/1681817855825?e=2147483647&v=beta&t=Qqaqt5VSOFw1op4pXzoyAsGjJWBM6z4T6t9iYj6GlEw",
                      "https://kalakritihyd.gitam.edu/admin/assets/uploads/photographs/5505b7b4abd5f6328e6f856f29943ada.jpg",
                      "https://media.licdn.com/dms/image/C5622AQFlvMj3oevrOQ/feedshare-shrink_800/0/1679303446739?e=1684972800&v=beta&t=2dVUy3N57xziO6hbc4b_C0XDVNJNQOxk1yw1M6onUY8",
                      "https://www.gitam.edu/sites/default/files/2022-09/faq.jpg",
                      "https://www.gitam.edu/sites/default/files/2022-09/About-the-Platform-gitam.png"
                    ];
                    var descriptions = [
                      "This women's day DARE. Harness the diversity of your skills. Learn, share collaborate.",
                      "From Dhoti to Mundum Neriyathum, Ghagra to Lepcha, you name it! ",
                      "Learn difficult topics, from computer science, with a simple and detailed explanation.",
                      "End Semester Examination means the examination to be held at the end of each semester.",
                      "Flutter is an open-source UI software development kit created by Google. "
                    ];
                    var dates = [
                      "8th May 2023",
                      "10th May 2023",
                      "14th May 2023",
                      "17th May 2023",
                      "24th May 2023",
                    ];
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            images[index],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 10, 17)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                title[index],
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                dates[index].toUpperCase(),
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                descriptions[index],
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, _) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 5),
            ),
          ]),
        ),
      ),
    );
  }
}
