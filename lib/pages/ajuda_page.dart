import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oonhecendo_organismo/main.dart';
import 'package:oonhecendo_organismo/models/opcao_model.dart';
import 'package:oonhecendo_organismo/pages/home_page.dart';
import 'package:oonhecendo_organismo/pages/widgets/option_widget.dart';
import 'package:oonhecendo_organismo/utils/imagem_util.dart';
import 'package:video_player/video_player.dart';

import '../settings/colors.dart';

class AjudaPage extends StatefulWidget {

  const AjudaPage({Key? key}) : super(key: key);

  @override
  State<AjudaPage> createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {

  double size = 30;
  double innerPadding = 0;

  bool videoAssistido = false;
  bool loading = false;
  bool loaded = false;
  bool play = false;
  bool mute = true;
  bool velocidade = true;

  late VideoPlayerController _controller;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/tutorial.mp4")
      ..initialize().then((_) => setState(() {
        //_controller.play();
      }));


  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Appcolors.backgroundcolor, Appcolors.backgroundcolor2],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 3*(MediaQuery.of(context).size.width/4),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _controller.value.isInitialized ?
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ) : Container(),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Appcolors.buttomcolor,
                                  child: IconButton(
                                      onPressed: (){
                                        if(videoAssistido){
                                          setState(() => videoAssistido = false);
                                          _restartVideo();
                                        }else{
                                          if(play){
                                            setState(() {
                                              _controller.pause();
                                              play = !play;
                                            });
                                          }else{
                                            setState(() {
                                              _controller.play();
                                              play = !play;
                                            });
                                          }
                                        }
                                      },
                                      style: ButtonStyle(),
                                      icon: Icon(videoAssistido ? Icons.refresh : (play ? Icons.pause : Icons.play_arrow), color: Colors.white,)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Appcolors.buttomcolor ,
                                  child: TextButton(
                                      onPressed: (){
                                        if(velocidade){
                                          setState(() {
                                            _controller.setPlaybackSpeed(2);
                                            velocidade = !velocidade;
                                          });
                                        }else{
                                          setState(() {
                                            _controller.setPlaybackSpeed(1);
                                            velocidade = !velocidade;
                                          });
                                        }
                                      },
                                      style: ButtonStyle(),
                                      child: Text(velocidade ? '1x' : '2x', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Appcolors.buttomcolor ,
                                child: IconButton(
                                    onPressed: (){
                                      if(mute){
                                        setState(() {
                                          _controller.setVolume(0);
                                          mute = !mute;
                                        });
                                      }else{
                                        setState(() {
                                          _controller.setVolume(1);
                                          mute = !mute;
                                        });
                                      }
                                    },
                                    style: ButtonStyle(),
                                    icon: Icon(mute ? Icons.volume_up : Icons.volume_off, color: Colors.white,)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: (MediaQuery.of(context).size.width/4),
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home())),
                              child: Icon(Icons.arrow_back, size: 150, color: Appcolors.titlecolor,),
                            ),

                            SizedBox(height: 20),

                            Text(
                              "Voltar",
                              style: GoogleFonts.robotoSlab(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.titlecolor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _restartVideo() {
    _controller.seekTo(Duration.zero);
    _controller.play();
  }
}
