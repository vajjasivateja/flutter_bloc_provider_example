import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/form_validation_bloc/signin_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/form_validation_bloc/signin_event.dart';
import 'package:flutter_bloc_provider_example/bloc/form_validation_bloc/signin_state.dart';

class FormValidationUsingBLoC extends StatefulWidget {
  const FormValidationUsingBLoC({Key? key}) : super(key: key);

  @override
  State<FormValidationUsingBLoC> createState() => _FormValidationUsingBLoCState();
}

class _FormValidationUsingBLoCState extends State<FormValidationUsingBLoC> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign In Validation with BLoC"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorMessage, style: TextStyle(color: Colors.red));
                } else {
                  return Container();
                }
              }),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailController.text.toString(), passwordController.text.toString()));
                },
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailController.text.toString(), passwordController.text.toString()));
                },
                decoration: InputDecoration(hintText: "Enter Password"),
              ),
              SizedBox(height: 20),
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(emailController.text.toString(), passwordController.text.toString()),
                      );
                    }
                  },
                  child: Text("Sign In"),
                  color: (state is SignInValidState) ? Colors.red : Colors.grey,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
