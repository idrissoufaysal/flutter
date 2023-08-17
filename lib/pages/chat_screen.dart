import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/pages/message.dart';
import 'package:renteasy/widgets/text_fild.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;

@override
void initState(){
 socket = IO.io('http://192.168.1.114:4000',
    IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .disableAutoConnect()  // disable auto-connection
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build()
  );
socket.connect();
setUpSocketListener();
super.initState();
}

//*Mes fonction de messagerie
    void sendMessage(String text) {
      var messageJson={
        "message":text,
        "sendByMe":socket.id
      };
    socket.emit('message',messageJson);
 }

      void setUpSocketListener(){
        socket.on('message-receive',(data){
          print(data);
        });
      }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grayText,
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return MessageItem(
                          sendByMe: false,
                        );
                      },
                    ),
                  )),
              Expanded(
                  child: Container(
                      color: blueText,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            ///**Champ d'envoie de message  */
                            textFild(
                                controller: msgInputController,
                                hintTxt: 'envoyer un message'),

                            ////*Le bouton d'envoie *///////////////////////////
                            Container(
                              margin: EdgeInsets.only(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: IconButton(
                                  onPressed: () {
                                    sendMessage(msgInputController.text);
                                    msgInputController.text = "";
                                  },
                                  icon: Icon(Icons.send_rounded)),
                            )

                            /// * */////////////////////////////////////////
                          ]
                    )
                )
              )
          ],
        ),
      )
    );
  }
}

//TODO_nouvel class MEssageItems////////////////////////////
class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.sendByMe});
  final bool sendByMe;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sendByMe ? Colors.purple : Colors.white,
        ),
        child: Text(
          'good morning',
          style: TextStyle(color: sendByMe ? white : Colors.purple),
        ),
      ),
    );
  }
}
