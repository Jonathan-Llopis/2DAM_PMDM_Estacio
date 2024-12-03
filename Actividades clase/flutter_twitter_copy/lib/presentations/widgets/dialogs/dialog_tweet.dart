import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_event.dart';

class DialogoEditTweet extends StatefulWidget {
  const DialogoEditTweet({super.key, required this.tweet});
  final Tweet? tweet;

  @override
  State<DialogoEditTweet> createState() => _DialogoEditTweetState();
}

class _DialogoEditTweetState extends State<DialogoEditTweet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.tweet != null) {
      _contentController.text = widget.tweet!.content;
      _imageController.text = widget.tweet!.image ?? "";
    } else {
      _contentController.text = "";
      _imageController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                   ListTile(
                      title: widget.tweet != null ? Text("Editar Tweet",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white)): Text("Crear Tweet",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white)) ),
                  Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            TextFormField(
                              controller: _contentController,
                              decoration: const InputDecoration(
                                labelText: "Contenido del Tweet",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _imageController,
                              decoration: const InputDecoration(
                                labelText: "Imagen: URL",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ]))),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar",
                                style: TextStyle(color: Colors.white))),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (widget.tweet != null) {
                                context.read<TweetBloc>().add(
                                      UpdateTweetUseCaseEvent(
                                        widget.tweet!.id,
                                        _contentController.text,
                                        _imageController.text,
                                      ),
                                    );
                              } else {
                                final authBloc =
                                    BlocProvider.of<AuthBloc>(context);
                                context.read<TweetBloc>().add(
                                      CreateTweetUseCaseEvent(
                                        authBloc.state.user!.id,
                                        _contentController.text,
                                        _imageController.text,
                                      ),
                                    );
                              }
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: const Text("Acceptar",
                                style: TextStyle(color: Colors.white))),
                      )
                    ],
                  ),
                ]));
          },
        ));
  }
}
