import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { Observable } from 'rxjs';

export type RequestWithUser = Request & {
  user: {
    id: string;
    name: string;
  };
};

@Injectable()
export abstract class DatabaseProvider {
  public abstract connect(): Promise<void>;
  public client: any;
}
@Injectable()
export class ExcludeNullInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    //remove
    const req = context.switchToHttp().getRequest();
    if (req.body) {
      Object.keys(req.body).forEach((key) => {
        if (req.body[key] === null) {
          delete req.body[key];
        }
      });
    }
    return next.handle();
  }
}
