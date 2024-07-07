// primero main
// segundo StatelessWindget
//tercero modificar nombre de la clase
//cuardo modificar nombre de "app" en runAPP(<nombreclase>)
//home: scaffold, puedo agregar appBar, body...
// en el stateleswidget incluimos un statefulwidget
// modificamos el nombre de la clase
//configuramos en el home anterior nombre de clase
//en el statefulwidget incluimos scaffold, title, text...
import 'package:colegio1/api/mostrar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(astrid());
}

class astrid extends StatelessWidget {
  const astrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: corredor());
  }
}

class corredor extends StatefulWidget {
  const corredor({super.key});

  @override
  State<corredor> createState() => _corredorState();
}

class _corredorState extends State<corredor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Colegio'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('incio'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_outward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Gestion de Estudiantes'),
              leading: Icon(Icons.book),
              trailing: Icon(Icons.arrow_outward),
              onTap: () {
                BuscaEstudiantes().then(
                  (r) => {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text('Gestion de Estudiantes'),
                          ),
                          body: ListView.builder(
                            itemCount: r.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(r[index].nombre),
                                subtitle: Text(r[index].apellido),
                                trailing: Text(r[index].identificacion),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  },
                );
              },
            ),
            ListTile(
              title: Text('temas'),
              leading: Icon(Icons.circle),
              trailing: Icon(Icons.arrow_outward),
            ),
            ListTile(
              title: Text('avance'),
              leading: Icon(Icons.group_work),
              trailing: Icon(Icons.arrow_outward),
            ),
            ListTile(
              title: Text('desarrollador'),
              leading: Icon(Icons.person_2_outlined),
              trailing: Icon(Icons.arrow_outward),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => programador()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text('app para estudiantes'),
        ],
      ),
    );
  }
}

//pagina desarrollador
class programador extends StatelessWidget {
  const programador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desarrollador')),
      body: ListView(
        children: [
          Center(
            child: Text('ADSO2626984', style: TextStyle(fontSize: 30)),
          ),
          ListTile(
            title: Text('Astrid'),
            subtitle: Text('nombre'),
            leading: Icon(Icons.person_2_outlined),
          ),
          ListTile(
            title: Text('Corredor'),
            subtitle: Text('apellido'),
            leading: Icon(Icons.person_2_rounded),
          ),
          Card(
            color: Colors.amber[50],
            child: ListTile(
              title: Text('nora_corredor@soy.sena.edu.co'),
              subtitle: Text('correo'),
              leading: Icon(Icons.mail_lock_sharp),
            ),
          ),
          Card(
            color: Colors.green[50],
            child: ListTile(
              title: Text('L-V 9am- 4pm'),
              subtitle: Text('horario'),
              leading: Icon(Icons.calendar_month),
            ),
          ),
        ],
      ),
    );
  }
}
