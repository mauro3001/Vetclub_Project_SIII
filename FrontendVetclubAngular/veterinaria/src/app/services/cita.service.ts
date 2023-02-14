import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cita } from '../models/cita';

@Injectable({
  providedIn: 'root'
})
export class CitaService {

  constructor(private http: HttpClient) { }

  url = "http://206.189.51.37:30100/api/cita"

  //metodo para llamar la info de citas conectados a bd y la interfaz
  obtenerCita():Observable<Cita[]>{
    let ruta = this.url+'s';
    return this.http.get<Cita[]>(ruta);
  }

  //metodo para llamar un solo usuario
  extraerCita(id:any):Observable<Cita>{
    let ruta1 = this.url+'/'+id;
    return this.http.get<Cita>(ruta1)
  }

  //poner informacion de un solo usuario
  putCita(form:Cita, id:any):Observable<Cita>{
    let ruta2 = this.url+'/'+id;
    return this.http.put<Cita>(ruta2, form)
  }

  //agregar una cita
  agregarCita(form: Cita):Observable<Cita>{
    let way = this.url+'/agregar';
    return this.http.post<Cita>(way,form);
  }

  //metodo para eliminar cita
  eliminarCita(id_cita:number):Observable<Cita>{
    let ruta2 = this.url+'/eliminar/'+id_cita

    return this.http.get<Cita>(ruta2, {
      headers: new HttpHeaders({ 'Content-Type': 'aplication/json'})
    })
  }
}
