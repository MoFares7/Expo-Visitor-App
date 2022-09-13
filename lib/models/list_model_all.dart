// ignore_for_file: sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> cityItems = [
  DropdownMenuItem(child: Text("Damascus".tr()), value: "damascus"),
  DropdownMenuItem(child: Text("r_damascus".tr()), value: "r_damascus"),
  DropdownMenuItem(child: Text("Alepoo".tr()), value: "Alepoo"),
  DropdownMenuItem(child: Text("kunaitra".tr()), value: "kunaitra"),
  DropdownMenuItem(child: Text("Daraa".tr()), value: "dara"),
  DropdownMenuItem(child: Text("Suwayda".tr()), value: "Suwayda"),
  DropdownMenuItem(child: Text("Homs".tr()), value: "homs"),
  DropdownMenuItem(child: Text("Tartous".tr()), value: "tartus"),
  DropdownMenuItem(child: Text("Latakia".tr()), value: "latakia"),
  DropdownMenuItem(child: Text("Hama".tr()), value: "hama"),
  DropdownMenuItem(child: Text("raqa".tr()), value: "raqa"),
  DropdownMenuItem(child: Text("Dir alZor".tr()), value: "Dir alZor"),
  DropdownMenuItem(child: Text("idlep".tr()), value: "idlep"),
];

List<DropdownMenuItem<String>> speItems = [
  DropdownMenuItem(child: Text(tr('business owner')), value: "business owner"),
  DropdownMenuItem(child: Text(tr('Student')), value: "Student"),
  DropdownMenuItem(child: Text(tr('Employee')), value: "Employee"),
  DropdownMenuItem(child: Text(tr('Journalist')), value: "Journalist"),
  DropdownMenuItem(child: Text(tr('Free Jop')), value: "Free Jop"),
];

List<DropdownMenuItem<String>> workItems = [
  DropdownMenuItem(
      child: Text(tr('Building and construction')),
      value: "Building and construction"),
  DropdownMenuItem(
      child: Text(tr('eating, air conditioning and water')),
      value: "eating, air conditioning and water"),
  DropdownMenuItem(child: Text(tr('Industrial')), value: "Industrial"),
  DropdownMenuItem(
      child: Text(tr('Decor, furnishing and carpentry')),
      value: "Decor, furnishing and carpentry"),
  DropdownMenuItem(
      child: Text(tr('Informatics, communications and digital services')),
      value: "Informatics, communications and digital services"),
  DropdownMenuItem(
      child: Text(tr('Imedicine and pharmacy')),
      value: "Imedicine and pharmacy"),
  DropdownMenuItem(child: Text(tr('dentistry')), value: "dentistry"),
  DropdownMenuItem(
      child: Text(tr('Laboratory or laboratory materials')),
      value: "Laboratory or laboratory materials"),
];

List<DropdownMenuItem<String>> studentItems = [
  DropdownMenuItem(child: Text(tr('medical')), value: "medical"),
  DropdownMenuItem(child: Text(tr('engineer')), value: "engineer"),
  DropdownMenuItem(child: Text(tr('Human sciences')), value: "Human sciences"),
  DropdownMenuItem(child: Text(tr('institution')), value: "institution"),
  DropdownMenuItem(child: Text(tr('school student')), value: "school student"),
];

List<DropdownMenuItem<String>> jurnalistItems = [
  DropdownMenuItem(
      child: Text(tr('Prepare and edit')), value: "Prepare and edit"),
  DropdownMenuItem(
      child: Text(tr('photography and cover')), value: "photography and cover"),
  DropdownMenuItem(
      child: Text(tr('journalist or media')), value: "journalist or media"),
];

List<DropdownMenuItem<String>> titleItems = [
  DropdownMenuItem(
    child: Text("mr".tr()),
    value: "mr",
  ),
  DropdownMenuItem(
    child: Text("eng".tr()),
    value: "eng",
  ),
  DropdownMenuItem(
    child: Text("dr".tr()),
    value: "dr",
  )
];
