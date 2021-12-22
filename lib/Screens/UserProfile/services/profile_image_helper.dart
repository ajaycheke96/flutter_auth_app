import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Services/student_service.dart';

class ProfileImageHelper extends StatefulWidget {
  ProfileImageHelper({Key? key, this.imageName}) : super(key: key);

  String? imageName;

  @override
  State<ProfileImageHelper> createState() => _ProfileImageHelperState();
}

class _ProfileImageHelperState extends State<ProfileImageHelper> {
  final StudentService _studentService = StudentService();
  String _base64 = '';

  @override
  void initState() {
    super.initState();
    /**
     * TODO: To Fetch image from Server
     */
    // if (widget.imageName != null) {
    //   _studentService
    //       .getImageFromServer(widget.imageName.toString())
    //       .then((value) {
    //     setState(() {
    //       _base64 = base64.encode(value.bodyBytes);
    //     });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    print("From ProfileImageHelper " + widget.imageName.toString());

    // if (widget.imageName != null) {
    //   if (_base64 == null) return new Container();
    //   Uint8List bytes = base64.decode(_base64);

    //   return Stack(
    //     alignment: Alignment.center,
    //     children: [
    //       buildCoverImage(),
    //       ClipOval(
    //         child: Material(
    //           color: Colors.transparent,
    //           child: Ink.image(
    //             image: MemoryImage(bytes),
    //             fit: BoxFit.cover,
    //             width: 128,
    //             height: 128,
    //             child: InkWell(
    //               onTap: () => print("Image Clicked"),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // } else {
    //   return buildTop();
    return buildTop();
    // }

    // // if (studentPhoto.toString().isEmpty) {
    // final image = NetworkImage(
    //   "https://images.pexels.com/photos/5428012/pexels-photo-5428012.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    // );
    // return ClipOval(
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Ink.image(
    //       image: image,
    //       fit: BoxFit.cover,
    //       width: 128,
    //       height: 128,
    //       child: InkWell(
    //         onTap: () => print("Image Clicked"),
    //       ),
    //     ),
    //   ),
    // );
    // // } else if(studentPhoto.toString().isNotEmpty) {
    // //   _studentService.getImageFromServer(studentPhoto.toString()).then(
    // //     (value) {
    // //       // print(value);
    // //       // File file=File(value, studentModel.studentPhoto.toString());
    // //       // image = Image(image: value);
    // //       // print("Image.memory(value)");
    // //       // print(image);

    // //       final decodedBytes = base64.decode(value);
    // //       var futureImage = decodeImageFromList(decodedBytes);
    // //       print(futureImage);

    // //       //  String validate= base64.normalize(value,1);
    // //       //  print(validate);
    // //       //  var image1= Image.memory().image;
    // //       //  print(image1);

    // //       // image=MemoryImage(decodedBytes);

    // //       // File file = File("decodedBezkoder.png");
    // //       // file.writeAsBytesSync(decodedBytes);
    // //       // children.add(Center(child: Ink.image(image: image)));
    // //       return Text("studentPhoto");
    // //     },
    // //   );
    // // }
    // // return Text("No Image");
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final double top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  final double coverHeight = 280;

  Widget buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.network(
        "https://images.pexels.com/photos/5428012/pexels-photo-5428012.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  final double profileHeight = 144;

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/5428012/pexels-photo-5428012.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
        ),
      );
}
