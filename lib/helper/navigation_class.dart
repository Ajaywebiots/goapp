import '../config.dart';



class NavigationClass {
  Future<Object?> pushNamedAndRemoveUntil(context, pageName, {arg}) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        pageName,
        arguments: arg,
            (route) => false,
      );

  Future<Object?>? pushNamed(context, pageName, {arg}) async{
    final result = await  Navigator.pushNamed(context, pageName, arguments: arg,);
    return result;
  }

  Future push(context, pageName, {arg}) async{
    final result = await  Navigator.push(context, MaterialPageRoute(builder: (context) => pageName,));
    return result;
  }



  void pop(context,{arg}) {
    Navigator.pop(context, arg);
  }

  void popAndPushNamed(context,pageName, {arg,result}) {
    Navigator.popAndPushNamed(context, pageName,arguments: arg,result: result,);

  }

  void pushReplacementNamed(context,pageName,{args}){
    Navigator.pushReplacementNamed(context, pageName,arguments: args,);
  }

  void pushAndRemoveUntil(context,{args}){

    Navigator.of(context).pushAndRemoveUntil(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => MultiProvider(providers: [

        ], child: const LoginScreen()),
      ),

      // this function should return true when we're done removing routes
      // but because we want to remove all other screens, we make it
      // always return false
          (Route route) => false,
    );
  }
}