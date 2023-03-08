import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/screens/userprofile/provider/be_artistprovider.dart';
import 'package:provider/provider.dart';

class BeAnartistForm extends StatefulWidget {
  const BeAnartistForm({super.key});

  @override
  State<BeAnartistForm> createState() => _BeAnartistFormState();
}

class _BeAnartistFormState extends State<BeAnartistForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  // TextEditingController aboutcontroller = TextEditingController();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? dropdownvalue;

  var items = [
    'ACTOR',
    'ACTRESS',
    'DIRECTOR',
    'PRODUCER',
    'SINGER',
    'CINEMATOGRAPHER',
    'EDITOR',
    'MUSICIAN',
    'TECHNICIAN',
    'MAKE-UP',
    'DANCER',
    'OTHER'
  ];

  @override
  Widget build(BuildContext context) {
    final providerBartist =
        Provider.of<BeArtistProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: height(context, 0.08),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boldtext('Be an artist!', Colors.white, 21),
                  SizedBox(
                    height: height(context, 0.013),
                  ),
                  normaltext('please fill the form to be an artist ',
                      const Color.fromARGB(255, 113, 113, 113), 13)
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, bottom: 15, top: 25),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: ListView(
                    children: [
                      DropdownButtonFormField(
                        menuMaxHeight: 260,
                        hint: normaltext('select category',
                            const Color.fromARGB(255, 187, 187, 187), 14),
                        dropdownColor: const Color.fromARGB(255, 77, 77, 77),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            dropdownvalue = newvalue!;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 190, 190, 190)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.02),
                      ),
                      TextFormField(
                        controller: providerBartist.aboutcontroller,
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
                          labelText: 'About your self',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 190, 190, 190)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.219),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (dropdownvalue != null &&
                                formKey.currentState!.validate()) {
                              providerBartist.beArtist(context, dropdownvalue);
                            } else {
                              CustomSnackBar().snackBar(
                                  context,
                                  'please fill all field',
                                  const Color.fromARGB(255, 154, 51, 44));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(color1()),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(20)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: const Text('Submit')),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
