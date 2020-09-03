import 'package:flutter/material.dart';
import '../viewModel/http_todos_view_model.dart';

class HttpTodosView extends HttpTodosViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: httpTodos.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(httpTodos[index].title),
            subtitle: Text(httpTodos[index].userId.toString()),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: buildTextAppBar(),
      leading: buildPaddingProgress,
    );
  }

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Text buildTextAppBar() => Text('Http Todos View');
}
