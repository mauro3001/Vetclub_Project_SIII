import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { mostrarMascota } from 'src/app/models/mostrar-mascota';
import { MascotaService } from 'src/app/services/mascota.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editar-mascota',
  templateUrl: './editar-mascota.component.html',
  styleUrls: ['./editar-mascota.component.css']
})
export class EditarMascotaComponent implements OnInit {

  constructor(private activeroute:ActivatedRoute, private router:Router, private form:FormsModule, private mascota:MascotaService) { }

  datosmascotas !: mostrarMascota

  editarMascota = new FormGroup({
    tipoMascota: new FormControl(''),
    nombre: new FormControl(''),
    raza: new FormControl(''),
    historial: new FormControl(''),
  });

  ngOnInit(): void {
    let id_masco = this.activeroute.snapshot.paramMap.get('id_mascota')
    this.mascota.extraerMascota(id_masco).subscribe(datos=>{
      this.datosmascotas = datos;
      console.log(datos)
      this.editarMascota.setValue({
        'tipoMascota': this.datosmascotas.tipoMascota,
        'nombre': this.datosmascotas.nombre,
        'raza': this.datosmascotas.raza,
        'historial': this.datosmascotas.historial,
      })
    })
  }

    putform(form: mostrarMascota){
    let masid_up = this.activeroute.snapshot.paramMap.get('id_mascota');
    this.mascota.putMascota(form,masid_up).subscribe(datos=>{
      Swal.fire('Mascota Actualizada', 'Mascota actualizada exitosamente', 'success');
      this.router.navigate(['mascotas']);
    })
  }

  regresar(){
    this.router.navigate(['mascotas']);
  }

}
