
import 'package:get_it/get_it.dart';
import 'package:appmode/features/presentation/bloc/login_cubic.dart';


final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc

    sl.registerFactory(() =>MainCubic());

    //Use Cases



    //Repository




    //DATA SOURCE




  }
}
