import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  double _currentDifficultyLevel = 0;

  final List<String> _difficultyTexts = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _appTitle(),
                _difficultySlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          "Frivia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          _difficultyTexts[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _difficultySlider() {
    return Slider(
      label: "Difficulty",
      activeColor: Colors.blue,
      min: 0,
      max: 2,
      divisions: 2,
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(
          () {
            _currentDifficultyLevel = _value;
          },
        );
      },
    );
  }
}
