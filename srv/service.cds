using {
    Directories as directories,
    Allocations as allocations,
    Derivations as derivations,
    ModelTables as modelTables,
    Functions   as functions,
    DirectoriesVH as directoriesVH,
} from '../db/schema';

@path : 'service/directories'
service Service {
    @odata.draft.enabled
    entity Directories as projection on directories order by
        sequence asc;
}

@path : 'service/functions'
service FunctionService {
    @odata.draft.enabled
    @Capabilities.FilterRestrictions: { RequiresFilter : true, RequiredProperties: ['directory_ID'] }
    entity Functions   as projection on functions actions {
        @title : 'Activate'
        action activate();
        @title : 'Deactivate'
        action deactivate();
    };

    @odata.draft.enabled
    entity Allocations as projection on allocations;

    @odata.draft.enabled
    entity Derivations as projection on derivations;

    @odata.draft.enabled
    entity ModelTables as projection on modelTables;

    @cds.odata.valuelist
    entity DirectoriesVH as projection on directoriesVH;
}
