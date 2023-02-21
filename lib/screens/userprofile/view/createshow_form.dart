import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/screens/userprofile/provider/createshow_provider.dart';
import 'package:provider/provider.dart';

class CreateShowScreen extends StatefulWidget {
  const CreateShowScreen({super.key});

  @override
  State<CreateShowScreen> createState() => _CreateShowScreenState();
}

class _CreateShowScreenState extends State<CreateShowScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? category;

  var items = ['Drama', 'Song', 'Dance', 'Mimicry'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateShowProvider>(context, listen: false);
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
                  const Text(
                    'Create new stage show',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: height(context, 0.013),
                  ),
                  const Text(
                    'please fill the form to create new show  ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 113, 113, 113),
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, bottom: 15, top: 25),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: provider.namecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "fill this field";
                          }
                          return null;
                        },
                        cursorColor: color1(),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(22),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Name of Programme',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 212, 212, 212)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      DropdownButtonFormField(
                        menuMaxHeight: 260,
                        hint: const Text(
                          'select category',
                          style: TextStyle(
                              color: Color.fromARGB(255, 212, 212, 212)),
                        ),
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
                            category = newvalue!;
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
                        height: height(context, 0.017),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: provider.amountcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "fill this field";
                          }
                          return null;
                        },
                        cursorColor: color1(),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(22),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Amount',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 212, 212, 212)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      TextFormField(
                        controller: provider.aboutcontroller,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "fill this field";
                          }
                          return null;
                        },
                        cursorColor: color1(),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'About the programme',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 212, 212, 212)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 38, 38, 38),
                        ),
                      ),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              provider.getimages();
                            },
                            child: Container(
                              height: height(context, 0.13),
                              width: width(context, 0.33),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 38, 38, 38),
                              ),
                              child: const Icon(
                                Icons.image,
                                color: Color.fromARGB(255, 198, 198, 198),
                                size: 39,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              provider.getvideo();
                            },
                            child: Container(
                              height: height(context, 0.13),
                              width: width(context, 0.33),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 38, 38, 38),
                              ),
                              child: const Icon(
                                Icons.video_file,
                                color: Color.fromARGB(255, 198, 198, 198),
                                size: 39,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height(context, 0.055),
                      ),
                      Consumer<CreateShowProvider>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate() &&
                                    category != null) {
                                  if (value.img != null &&
                                      value.video != null) {
                                    value.createshow(category, context);
                                  } else {
                                    CustomSnackBar().snackBar(
                                        context,
                                        'select image&video',
                                        const Color.fromARGB(255, 126, 42, 36));
                                  }
                                } else {
                                  CustomSnackBar().snackBar(
                                      context,
                                      'fill all field',
                                      const Color.fromARGB(255, 126, 42, 36));
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
                              child: value.isload == true
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : const Text('Submit'));
                        },
                      )
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
