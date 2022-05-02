using {Directories as directories} from '../db/schema';

service Service {
    entity Directories as projection on directories order by sequence asc;
}
