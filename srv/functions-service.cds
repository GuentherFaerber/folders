using {
    Allocations as allocations,
    Derivations as derivations,
    ModelTables as modelTables,
    Functions   as functions,
} from '../db/schema';

@path : 'service/functions'
service FunctionService {
    @odata.draft.enabled
    entity Functions   as projection on functions;

    @odata.draft.enabled
    entity Allocations as projection on allocations;

    @odata.draft.enabled
    entity Derivations as projection on derivations;

    @odata.draft.enabled
    entity ModelTables as projection on modelTables;
}
