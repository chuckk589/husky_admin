import { Injectable } from '@nestjs/common';

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
