"Crear Server"
server := TusLibrosServer over: TusLibrosInputInterfaceBuilder defaultInterface webServer:  (WebServer new listenOn: 8080; yourself).
"Eliminar Server"
server destroy. 
"Abrir Ventana de Log In"
TusLibrosLoginPresenter open.

"para loguearse Usuario: Cliente1 Password: pass1"
