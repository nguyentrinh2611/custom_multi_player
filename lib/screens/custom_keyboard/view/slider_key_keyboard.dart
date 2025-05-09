// import 'package:demo_player/media_player/view/media_player.dart';
// import 'package:flutter/material.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/foundation.dart' as foundation;
// import 'package:flutter/services.dart';

// class SlideKeyboardEffect extends StatefulWidget {
//   const SlideKeyboardEffect({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SlideKeyboardEffectState createState() => _SlideKeyboardEffectState();
// }

// class _SlideKeyboardEffectState extends State<SlideKeyboardEffect>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   FocusNode focusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 100),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, 1), // Bắt đầu từ ngoài màn hình
//       end: Offset(0, 0), // Chuyển vào vị trí cuối
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     ));
//   }

//   void _toggleKeyboard() {
//     setState(() {
//       focusNode.requestFocus();
//     });
//     _controller.forward();
//   }

//   final _textController = TextEditingController();
//   final _scrollController = ScrollController();
//   bool _emojiShowing = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Demo Player'),
//       ),
//       resizeToAvoidBottomInset: focusNode.hasPrimaryFocus,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                   child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _emojiShowing = false;
//                     focusNode.unfocus();
//                     _controller.reverse();
//                   });
//                 },
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const MediaPlayer()));
//                   },
//                   child: Container(
//                       color: Colors.transparent,
//                       alignment: Alignment.center,
//                       child: Text(_textController.text)),
//                 ),
//               )),
//               Container(
//                 color: Colors.white,
//                 alignment: Alignment.bottomCenter,
//                 child: SlideTransition(
//                   position: _slideAnimation,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     color: Colors.cyanAccent,
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.account_circle_rounded)),
//                         Expanded(
//                           child: TextFormField(
//                             onFieldSubmitted: (value) {},
//                             onTap: () {
//                               if (_emojiShowing)
//                                 setState(() {
//                                   _emojiShowing = !_emojiShowing;
//                                 });
//                             },
//                             textAlign: TextAlign.start,
//                             cursorColor: Colors.white,
//                             controller: _textController,
//                             scrollController: _scrollController,
//                             obscureText: false,
//                             obscuringCharacter: "*",
//                             focusNode: focusNode,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w300,
//                             ),
//                             decoration: InputDecoration(
//                               suffixIcon: Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     GestureDetector(
//                                         onTap: () {
//                                           SystemChannels.textInput
//                                               .invokeMethod<void>(
//                                                   'TextInput.hide');
//                                           setState(() {
//                                             _emojiShowing = !_emojiShowing;
//                                           });
//                                           if (_emojiShowing) {
//                                             // FocusScope.of(context).unfocus();
//                                           } else {
//                                             FocusScope.of(context)
//                                                 .requestFocus();
//                                           }
//                                         },
//                                         child: Icon(
//                                             Icons.emoji_emotions_outlined)),
//                                     SizedBox(
//                                       width: 8,
//                                     ),
//                                     Icon(Icons.star_border_outlined),
//                                   ],
//                                 ),
//                               ),
//                               counterText: '',
//                               hintText: 'enter comment',
//                               labelStyle: TextStyle(color: Colors.white),
//                               errorStyle: TextStyle(
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.redAccent),
//                               errorMaxLines: 2,
//                               filled: true,
//                               fillColor: Color.fromARGB(255, 180, 179, 179),
//                               contentPadding: EdgeInsets.all(10),
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _textController.text = _textController.text;
//                               });
//                             },
//                             icon: Icon(Icons.send))
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Offstage(
//                 offstage: !_emojiShowing,
//                 child: EmojiPicker(
//                   textEditingController: _textController,
//                   scrollController: _scrollController,
//                   config: Config(
//                     height: 256,
//                     checkPlatformCompatibility: true,
//                     viewOrderConfig: const ViewOrderConfig(),
//                     emojiViewConfig: EmojiViewConfig(
//                       // Issue: https://github.com/flutter/flutter/issues/28894
//                       emojiSizeMax: 28 *
//                           (foundation.defaultTargetPlatform ==
//                                   TargetPlatform.iOS
//                               ? 1.2
//                               : 1.0),
//                     ),
//                     skinToneConfig: const SkinToneConfig(),
//                     categoryViewConfig: const CategoryViewConfig(),
//                     bottomActionBarConfig: const BottomActionBarConfig(),
//                     searchViewConfig: const SearchViewConfig(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           if (!focusNode.hasPrimaryFocus && !_emojiShowing)
//             Positioned(
//               bottom: 0,
//               child: GestureDetector(
//                 onTap: _toggleKeyboard,
//                 child: Container(
//                   width: 360,
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(20)),
//                         height: 38,
//                         child: Row(
//                           children: [
//                             Expanded(child: Text('Enter comment')),
//                             IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _emojiShowing = true;
//                                 });
//                                 _controller.forward();
//                               },
//                               icon: Icon(
//                                 Icons.emoji_emotions_outlined,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       )),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                           child: const Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       )),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Icon(
//                         Icons.mode_comment_outlined,
//                         color: Colors.white,
//                         weight: 1,
//                       ),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
