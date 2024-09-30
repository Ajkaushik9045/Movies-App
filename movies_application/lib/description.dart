import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, banner_url, vote, poster_url, launch_date;
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.banner_url,
      required this.poster_url,
      required this.vote,
      required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    banner_url,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    child: Text(
                      "Avarage Rating - $vote",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(padding: const EdgeInsets.all(10),
          child: Text(name!=Null?name:"Not loaded",style: const TextStyle(fontSize: 24,color: Colors.white),),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("Release on - $launch_date",style: const TextStyle(color: Colors.white,fontSize:16),),
          ),Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(description,style: const TextStyle(color: Colors.white,fontSize: 16),),
            ),
          )
        ],
      ),
    );
  }
}
