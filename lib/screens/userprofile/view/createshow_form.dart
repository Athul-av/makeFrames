import 'package:flutter/material.dart';
import 'package:makeframes/core/const.dart';
import 'package:makeframes/core/snackbar.dart';
import 'package:makeframes/core/stage_textfield.dart';
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
 
  var items = ['DRAMA','SONG','DANCE','MIMICRY','SKIT','OTHER']; 

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
                height: height(context, 0.07),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    provider.clearTextfield();
                    provider.thumbnail = null;
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boldtext('Create new stage show', Colors.white, 21),
                  SizedBox(
                    height: height(context, 0.011),
                  ),
                  normaltext('please fill the form to create new show  ',
                      const Color.fromARGB(255, 113, 113, 113), 13)
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, bottom: 15, top: 18),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: ListView(
                    children: [
                      CreateStageTextField(
                          controller: provider.namecontroller,
                          cursorcolor: color1(),
                          validatormessage: 'fill this field',
                          label: 'Name of Programme',
                          keyboardtype: TextInputType.name,
                          contentpadding: 22),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      DropdownButtonFormField(
                        menuMaxHeight: 260,
                        hint: normaltext('select category',
                            const Color.fromARGB(255, 212, 212, 212), 14),
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
                      CreateStageTextField(
                          controller: provider.amountcontroller,
                          cursorcolor: color1(),
                          label: 'Amount',
                          validatormessage: 'fill this field',
                          keyboardtype: TextInputType.number,
                          contentpadding: 22),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      CreateStageTextField(
                          controller: provider.aboutcontroller,
                          cursorcolor: color1(),
                          label: 'About the programme',
                          maxlines: 2,
                          validatormessage: 'fill this field',
                          keyboardtype: TextInputType.name,
                          contentpadding: 20),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'minimum 40 letters*',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 162, 162, 162),
                                  fontSize: 7),
                            ),
                          )),
                      SizedBox(
                        height: height(context, 0.017),
                      ),
                      Consumer<CreateShowProvider>(
                        builder: (context, value, child) {
                          return Row(
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
                                  child: value.img != null
                                      ? Image.file(
                                          value.img![0],
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(
                                          Icons.image,
                                          color: Color.fromARGB(
                                              255, 198, 198, 198),
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
                                  child: value.thumbnail != null
                                      ? Image.memory(
                                          value.thumbnail!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(
                                          Icons.video_file,
                                          color: Color.fromARGB(
                                              255, 198, 198, 198),
                                          size: 39,
                                        ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //  Text('image',style: TextStyle(color: Colors.white,fontSize: 10),),
                          normaltext('image', Colors.white, 10),
                          normaltext('video', Colors.white, 10),
                        ],
                      ),
                      SizedBox(
                        height: height(context, 0.04),
                      ),
                      Consumer<CreateShowProvider>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate() &&
                                    category != null) {
                                  if (value.img != null &&
                                      value.video != null &&
                                      provider.aboutcontroller.text.length >=
                                          40) {
                                    value.createshow(category, context);
                                  } else if (provider
                                          .aboutcontroller.text.length <
                                      30) {
                                    CustomSnackBar().snackBar(
                                        context,
                                        'please input atleast 40 letters in about field',
                                        const Color.fromARGB(255, 126, 42, 36));
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
