import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // Back
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
  ];

  void rotateTop() {
    List<Color> topRowFront = [faces[2][0], faces[2][1]];
    List<Color> topRowLeft = [faces[5][0], faces[5][1]];
    List<Color> topRowRight = [faces[0][0], faces[0][1]];
    List<Color> topRowBack = [faces[4][0], faces[4][1]];

    faces[2][0] = topRowLeft[0];
    faces[2][1] = topRowLeft[1];
    faces[5][0] = topRowBack[0];
    faces[5][1] = topRowBack[1];
    faces[0][0] = topRowFront[0];
    faces[0][1] = topRowFront[1];
    faces[4][0] = topRowRight[0];
    faces[4][1] = topRowRight[1];
  }
  
  void rotateBottom() {
    List<Color> bottomRowFront = [faces[2][2], faces[2][3]];
    List<Color> bottomRowLeft = [faces[5][2], faces[5][3]];
    List<Color> bottomRowRight = [faces[0][2], faces[0][3]];
    List<Color> bottomRowBack = [faces[4][2], faces[4][3]];

    faces[2][2] = bottomRowRight[0];
    faces[2][3] = bottomRowRight[1];
    faces[5][2] = bottomRowFront[0];
    faces[5][3] = bottomRowFront[1];
    faces[0][2] = bottomRowBack[0];
    faces[0][3] = bottomRowBack[1];
    faces[4][2] = bottomRowLeft[0];
    faces[4][3] = bottomRowLeft[1];
  }

  void rotateLeft() {
    List<Color> leftColumnTop = [faces[1][0], faces[1][2]];
    List<Color> leftColumnFront = [faces[2][0], faces[2][2]];
    List<Color> leftColumnBottom = [faces[3][0], faces[3][2]];
    List<Color> leftColumnBack = [faces[4][0], faces[4][2]];

    faces[1][0] = leftColumnBack[0];
    faces[1][2] = leftColumnBack[1];
    faces[2][0] = leftColumnTop[0];
    faces[2][2] = leftColumnTop[1];
    faces[3][0] = leftColumnFront[0];
    faces[3][2] = leftColumnFront[1];
    faces[4][0] = leftColumnBottom[0];
    faces[4][2] = leftColumnBottom[1];
  }

  void rotateRight() {
    List<Color> rightColumnTop = [faces[1][1], faces[1][3]];
    List<Color> rightColumnFront = [faces[2][1], faces[2][3]];
    List<Color> rightColumnBottom = [faces[3][1], faces[3][3]];
    List<Color> rightColumnBack = [faces[4][1], faces[4][3]];

    faces[1][1] = rightColumnFront[0];
    faces[1][3] = rightColumnFront[1];
    faces[2][1] = rightColumnBottom[0];
    faces[2][3] = rightColumnBottom[1];
    faces[3][1] = rightColumnBack[0];
    faces[3][3] = rightColumnBack[1];
    faces[4][1] = rightColumnTop[0];
    faces[4][3] = rightColumnTop[1];
  }

  void rotateFront() {
    List<Color> frontRowTop = [faces[1][2], faces[1][3]];
    List<Color> frontRowLeft = [faces[5][1], faces[5][3]];
    List<Color> frontRowRight = [faces[0][0], faces[0][1]];
    List<Color> frontRowBottom = [faces[3][0], faces[3][1]];

    faces[1][2] = frontRowLeft[0];
    faces[1][3] = frontRowLeft[1];
    faces[5][1] = frontRowBottom[0];
    faces[5][3] = frontRowBottom[1];
    faces[0][0] = frontRowTop[0];
    faces[0][1] = frontRowTop[1];
    faces[3][0] = frontRowRight[0];
    faces[3][1] = frontRowRight[1];
  }

  void rotateBack() {
    List<Color> backRowTop = [faces[1][0], faces[1][1]];
    List<Color> backRowLeft = [faces[5][0], faces[5][2]];
    List<Color> backRowRight = [faces[0][2], faces[0][3]];
    List<Color> backRowBottom = [faces[3][2], faces[3][3]];

    faces[1][0] = backRowRight[0];
    faces[1][1] = backRowRight[1];
    faces[5][0] = backRowTop[0];
    faces[5][2] = backRowTop[1];
    faces[0][2] = backRowBottom[0];
    faces[0][3] = backRowBottom[1];
    faces[3][2] = backRowLeft[0];
    faces[3][3] = backRowLeft[1];
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({Key? key}) : super(key: key);

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTop() {
    setState(() {
      cube.rotateTop();
    });
  }

  void rotateBottom() {
    setState(() {
      cube.rotateBottom();
    });
  }

  void rotateLeft() {
    setState(() {
      cube.rotateLeft();
    });
  }

  void rotateRight() {
    setState(() {
      cube.rotateRight();
    });
  }

  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2x2 Rubik\'s Cube'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[0]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[1]),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[2]),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[3]),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[4]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[5]),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_right_rounded,
                color: Colors.black,
                ),
                label: const Text('Right'),
                onPressed: rotateRight,
                ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_left_rounded,
                color: Colors.black,
                ),
                label: const Text('Left'),
                onPressed: rotateLeft,
                ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_downward_rounded,
                color: Colors.black,
                ),
                label: const Text('Bottom'),
                onPressed: rotateBottom,
                ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.black,
                ),
                label: const Text('Top'),
                onPressed: rotateTop,
                ),
          ],
        ),
      ),
    );
  }
}
