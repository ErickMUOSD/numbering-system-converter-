import 'package:flutter/material.dart';

const kWhiteColor = Color(0xFFFFFFFF);
const kMainColor = Color(0xFFFF504F);
const kColorTransparent = Colors.transparent;
const decorationTextFiled = InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 10.0, left: 20.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kColorTransparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kColorTransparent),
                            ),
                          );