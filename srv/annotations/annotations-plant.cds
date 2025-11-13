using {PurchaseOrder as service} from '../services';

annotate service.VH_Plant with {
    Plant @title : 'Plant';
    PlantName @title : 'Plant Name';
    CompanyCode @title : 'Company Code';
    CompanyCodeName @title : 'Company Name'
};


annotate service.VH_Plant with @(
    UI.SelectionFields  : [
        CompanyCode
    ]
);

