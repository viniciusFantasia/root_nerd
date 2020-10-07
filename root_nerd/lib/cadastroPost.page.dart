import "package:flutter/material.dart";

class CadastroPostPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Publicação",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          FlatButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  //TODO: Salvar os dados do banco de dados (Firestone)
                  //TODO: Mostrar uma mensagem de sucesso.
                  Navigator.of(context).pop();
                }
              })
        ],
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
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
                  labelText: "Escreva uma Descrição",
                ),
                minLines: 1,
                maxLines: 5,
                maxLength: 200,
                enabled: true,
                keyboardType: TextInputType.multiline,
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 60,
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
                    "Compartilhar",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Color(0xFF99e265),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
