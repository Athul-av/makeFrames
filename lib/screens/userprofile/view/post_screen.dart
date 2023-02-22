import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/provider/post_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
 const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postprovider = Provider.of<PostProvidr>(context);
    return Scaffold(
      backgroundColor: scaffoldback,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
            postprovider.file = null;
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Consumer<PostProvidr>(
                  builder: (context, value, child) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 28),
                        height: height(context, 0.45),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: const Color.fromARGB(255, 22, 22, 22)),
                        child: value.file != null
                            ? Image(
                                image: FileImage(value.file!),
                              )
                            : const Icon(
                                Icons.image_not_supported,
                                color: Color.fromARGB(255, 115, 115, 115),
                                size: 80,
                              ));
                  },
                ),
                SizedBox(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: const Color.fromARGB(255, 69, 69, 69),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        postprovider.getfile(context);
                      },
                    ),
                  ),
                ),
              ]),
              hsizedbox(context, 0.06),
              TextFormField(
                controller: postprovider.comentcontroller,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "fill this field";
                  }
                  return null;
                },
                cursorColor: color1(),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(25),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'comment...',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(255, 190, 190, 190)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 38, 38, 38),
                ),
              ),
              hsizedbox(context, 0.02),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color1()),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (postprovider.file != null) {
                      await postprovider.uploadpost(context);
                      Navigator.of(context).pop();
                      postprovider.file = null;
                      // postprovider.comentcontroller.clear();

                    } else {
                      CustomSnackBar().snackBar(context, 'pick a image',
                          const Color.fromARGB(255, 137, 38, 31));
                    }
                  },
                  child: Consumer<PostProvidr>(
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: value.load
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                            : const Text(
                                'POST',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
