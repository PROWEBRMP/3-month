import 'package:flutter/material.dart';
import 'package:template_for_lessons/ui/template/page_template.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return const PageTemplate(
      title: 'Settings',  
      haveSettingsButton: false,
      
    );
  }
} 
// 'api.openweathermap.org/data/2.5/weather?q=London&appid=d3866775bc3ab9f3c19835a56ef5cc16'
