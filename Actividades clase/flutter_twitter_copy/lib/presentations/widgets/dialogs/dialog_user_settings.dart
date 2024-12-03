import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';

class DialogoUserSettings extends StatefulWidget {
  const DialogoUserSettings({super.key});

  @override
  State<DialogoUserSettings> createState() => _DialogoUserSettingsState();
}

class _DialogoUserSettingsState extends State<DialogoUserSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();

  @override
  void initState() {
    final userBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
    _nombreController.text = userBloc.state.user!.username;
    _avatarController.text = "";
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
                  const ListTile(
                      title: Text("Ajustes del Usuario",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                  Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            TextFormField(
                              controller: _nombreController,
                              decoration: const InputDecoration(
                                labelText: "Nombre de Usuario",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _avatarController,
                              decoration: const InputDecoration(
                                labelText: "Avatar: URL",
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
                              context.read<AuthBloc>().add(
                                    UpdateUserInfoUseCaseEvent(
                                      state.user!.id,
                                      _avatarController.text,
                                      _nombreController.text,
                                    ),
                                  );

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
