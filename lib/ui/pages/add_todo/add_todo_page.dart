import 'package:bloc_demo/blocs/todos_bloc/todos_bloc.dart';
import 'package:bloc_demo/data/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/todo.dart';
import '../../components/custom_button/custom_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../styles/styles.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  final _formKey = GlobalKey<FormState>();
  final FocusNode _todoFC = FocusNode();
  final TextEditingController _todoTEC = TextEditingController();
  final ValueNotifier<bool> _confirmButtonEnabled = ValueNotifier(false);
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.blue1,
        title: Text(
          "Aggiungi todo",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: _mainStack(context)
      )
    );
  }

  Widget _mainStack(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned.fill(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _nameField(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: _confirmButton(context),
        ),
      ],
    );
  }

  Widget _nameField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 32, 0, 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Aggiungi una cosa da fare",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: Styles.grey4)
            ),
            child: CustomTextFormField(
              hintText: "Scrivi qui..",
              focusNode: _todoFC,
              controller: _todoTEC,
              onChanged: (text) {
                _validateFields();
              },
              textInputType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }


  Widget _confirmButton(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _confirmButtonEnabled,
      builder: (context, enabled, _) {
        return BlocListener<TodosBloc, TodosState>(
          listener: (context, state) async {
            if (state is TodoAdded) {
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state is TodosLoading) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 22, 0, 22),
                  width: double.infinity, child: const CircularProgressIndicator.adaptive(),
                );
              } else {
                return CustomButton(
                  enabled: enabled,
                  onPressed: () async {
                    final todo = Todo(
                      id: const Uuid().v1(),
                      content: _todoTEC.value.text,
                      done: false,
                      createdAt: _databaseService.timestamp.millisecondsSinceEpoch.toString(),
                      updatedAt: _databaseService.timestamp.millisecondsSinceEpoch.toString(),
                    );
                    context.read<TodosBloc>().add(AddTodoEvent(todo: todo));
                  },
                  width: double.infinity,
                  externalMargin: EdgeInsets.zero,
                  innerPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  borderRadius: BorderRadius.circular(9),
                  text: const Text(
                    "Salva",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                    maxLines: 1,
                  ),
                  useShadow: enabled ? true : false,
                  disabledColor: Styles.blue1.withOpacity(0.6),
                  backgroundColor: Styles.blue1.withOpacity(1),
                  gradient: !enabled
                      ? null
                      : const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Styles.blue3, Styles.blue2],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  bool isTextControllerEmpty(TextEditingController controller) {
    bool result = false;
    if(controller.value.text.isEmpty) {
      return true;
    }
    return result;
  }

  void _validateFields() {
    bool result = true;
    if (isTextControllerEmpty(_todoTEC)) {
      result = false;
    }
    _confirmButtonEnabled.value = result;
  }

}
