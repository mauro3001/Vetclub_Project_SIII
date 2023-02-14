import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Usuario } from '../models/usuario';
import { Login } from '../models/login';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  login: Login;

  constructor(private http: HttpClient) { }

  url = "http://206.189.51.37:30100/api/usuario"

  //metodo para llamar la informacion de los usuarios conectandose a bd y usando el backend
  obtenerUsuario():Observable<Usuario[]>{
    let ruta = this.url+'s';
    return this.http.get<Usuario[]>(ruta);
  }

  //metodo para llamar un solo usuario
  extraerUsuario(id:any):Observable<Usuario>{
    let ruta1 = this.url+'/'+id;
    return this.http.get<Usuario>(ruta1)
  }

  //poner informacion actulizada de un solo usuario
  putUsuario(form:Usuario, id:any):Observable<Usuario>{
    let ruta2 = this.url+'/'+id;
    return this.http.put<Usuario>(ruta2, form)
  }

  //metodo para agregar usuario
  agregarUser(form: Usuario):Observable<Usuario>{
    let way = this.url+'/agregar';
    return this.http.post<Usuario>(way,form)
  }

  //metodo para eliminar un usuario
  eliminarUsuario(id_usuario:number):Observable<Usuario>{
    let ruta2 = this.url+'/eliminar/'+id_usuario;

    return this.http.get<Usuario>(ruta2, {
      headers: new HttpHeaders({ 'Content-Type': 'aplication/json'})
    })
  }
}