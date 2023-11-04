export class UpdateMetaDto {
  [key: string]: {
    [key: string]: {
      formatter: string[];
      header: string;
    };
  };
}
