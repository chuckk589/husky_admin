import { NestInterceptor, ExecutionContext, CallHandler } from '@nestjs/common';
import { Injectable } from '@nestjs/common/decorators/core';
import { Observable } from 'rxjs';

@Injectable()
export class ExcludeNullInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    //remove
    const req = context.switchToHttp().getRequest();
    if (req.body) {
      Object.keys(req.body).forEach((key) => {
        if (req.body[key] == '') {
          req.body[key] = null;
        }
      });
    }
    return next.handle();
  }
}
