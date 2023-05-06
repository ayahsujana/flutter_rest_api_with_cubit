// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/detail_model.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({
    Key? key,
    required this.states,
  }) : super(key: key);
  final List<DetailModel> states;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(states[index].videoTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(states[index].categoryName, style:  GoogleFonts.angkor(color: Colors.cyan,fontWeight: FontWeight.w600, fontSize: 15),),
                  const Spacer(),
                  Text('SUBSCRIBE', style: GoogleFonts.poppins(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
          ],
        );
      },
      itemCount: states.length,
    );
  }
}
