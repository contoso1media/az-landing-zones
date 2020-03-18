import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { EnvService } from '../services/env.service';
import { NgForm } from '@angular/forms';
import { from } from 'rxjs';
import { Guid } from "guid-typescript";

@Component({
  selector: 'app-env',
  templateUrl: './env.component.html',
  styleUrls: ['./env.component.css']
})
export class EnvComponent implements OnInit {

  constructor(private toastr: ToastrService, private apiService: EnvService) { }

  ngOnInit() {

  }

  onSubmit(form) {
    
    console.log('build =====>', form);
    var buildId = Guid.create().toString();
    
    var build = {
        id : buildId,
        name : form.value.name,
        email : form.value.email,
        comment : form.value.comment,
        data: form.value.dataselected,
        image : form.value.imageselected,
        requesttime: Date.now()
    };
   
    console.log('pass data =====>', build);

    this.apiService.goBuild(build)
    .subscribe(res => {
      console.log(res); 
    }, err => {
      console.log(err);
    });

   
    this.toastr.success('The deployment request has been submitted successfully', 'Success!');
  }


  /**
   * success, error, info, warning take (message, title, ToastConfig)
   * Example :
   * this.toastr.error('everything is broken', 'Major Error', {
     timeOut: 3000
    });
   */


}
