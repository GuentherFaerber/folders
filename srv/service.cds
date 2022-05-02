using {Environments as environments} from '../db/schema';

service Service {
    entity Environments as projection on environments order by sequence asc;
}
