import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/models/usuario';
import { LoginService } from 'src/app/services/login.service';
import { UsuarioService } from 'src/app/services/usuario.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-listar-usuario',
  templateUrl: './listar-usuario.component.html',
  styleUrls: ['./listar-usuario.component.css']
})
export class ListarUsuarioComponent implements OnInit {

  usuario : Usuario[] = []

  constructor(private usuarioService: UsuarioService, private router: Router, private login: LoginService) { }

  ngOnInit(): void {
    this.cargarUsuario()
  }

  cargarUsuario(){
    this.usuarioService.obtenerUsuario().subscribe(datos=> {
      this.usuario = datos
    })
  }

  nuevoUsuario(){
    this.router.navigate(['usuarios/usuario'])
  }

  editarUsuario(id_usuario: any){
    this.router.navigate(['usuarios/editarUsuario', id_usuario])
  }

  eliminarUser(id_usuario: any){
    this.usuarioService.eliminarUsuario(id_usuario).subscribe(fin=> {
      this.cargarUsuario()
      Swal.fire('Usuario Eliminado', 'Usuario eliminado correctamente', 'success');
    })
  }

  regresar(){
    this.router.navigate(['admin']);
  }

}
