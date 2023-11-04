import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-custom';
import { RequestWithUser } from 'src/types/interfaces';
import { AuthService } from '../auth.service';

@Injectable()
export class LocalVersionStrategy extends PassportStrategy(Strategy, 'version') {
  constructor(private readonly authService: AuthService) {
    super();
  }

  async validate(req: RequestWithUser) {
    // const validate = await this.authService.validateVersion(version);
    if (req.user) {
      return req.user;
    } else {
      throw new UnauthorizedException('Invalid version');
    }
  }
}
