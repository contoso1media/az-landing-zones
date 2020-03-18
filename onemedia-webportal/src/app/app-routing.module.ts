import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { EnvComponent } from './env/env.component';
import { InfraComponent } from './infra/infra.component';
import { NoPageFoundComponent } from './no-page-found/no-page-found.component';



const routes: Routes = [
    { path: '', redirectTo: '/home', pathMatch: 'full' },
    { path: 'home', component: HomeComponent },
    { path: 'env', component: EnvComponent },
    { path: 'infra', component: InfraComponent },
    { path: '**', component: NoPageFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
