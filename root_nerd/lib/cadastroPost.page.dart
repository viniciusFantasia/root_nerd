import "package:flutter/material.dart";

class CadastroPostPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criação de Post",
          textAlign: TextAlign.center,
        ),
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.save),
        //       onPressed: () {
        //         if (formKey.currentState.validate()) {
        //           //TODO: Salvar os dados do banco de dados (Firestone)
        //           //TODO: Mostrar uma mensagem de sucesso.
        //           Navigator.of(context).pop();
        //         }
        //       })
        // ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.network(
                  'https://via.placeholder.com/300x200.png?text=Image1'),
              SizedBox(
                height: 10,
              ),
              Text('Upload de Imagem'),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Referência",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Escreva uma Legenda",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate())
                      Navigator.of(context).pushNamed('/home');
                  },
                  child: Text(
                    "Publicar",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
