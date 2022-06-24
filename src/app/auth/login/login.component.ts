import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { HeaderComponent } from 'src/app/header/header.component';
import { AuthService } from '../service/auth.service';
import { LoginRequestPayload } from './login-request.payload';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  loginRequestPayload: LoginRequestPayload;
  registerSuccessMessage: string;
  isError: boolean;

  constructor(
    private authService: AuthService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {
    this.isError = false;
    this.registerSuccessMessage = '';
    this.loginForm = new FormGroup({
      username: new FormControl('', Validators.required),
      password: new FormControl('', Validators.required),
    });
    this.loginRequestPayload = {
      username: '',
      password: '',
    };
    this.activatedRoute.queryParams.subscribe((params: any) => {
      if (
        params['registered'] !== undefined &&
        params['registered'] === 'true'
      ) {
        alert('Signup Successful');
      }
    });
  }

  ngOnInit(): void {}

  login() {
    this.loginRequestPayload.username = this.loginForm.get('username')!.value;
    this.loginRequestPayload.password = this.loginForm.get('password')!.value;

    this.authService.login(this.loginRequestPayload).subscribe((data) => {
      if (data) {
        this.router.navigateByUrl('/');
      } else {
        alert('Login unsuccessful');
      }
    });
  }
}
