import { Component, OnInit } from '@angular/core';

import { ToastrService } from 'ngx-toastr';
import { ApiService } from '../services/api.service';
import { Guid } from "guid-typescript";


@Component({
  selector: 'app-contact',
  templateUrl: './infra.component.html',
  styleUrls: ['./infra.component.css']
})
export class InfraComponent implements OnInit {

  constructor(private toastr: ToastrService, private apiService: ApiService ) {
      
  }
 
   ngOnInit() {
 
      
  }
 
   onSubmit(form) {
    
     console.log('build =====>', form);

     var buildId = Guid.create().toString();
     console.log('build id =====>', buildId);

     var build = {
         id : buildId,
         name : form.value.name,
         email : form.value.email,
         comment : form.value.comment,
         location : form.value.location,
         lifetime : form.value.lifetime,
         image : form.value.selected,
         requesttime: Date.now().toString()
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
