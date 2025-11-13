using {PurchaseOrder as service} from '../services';

annotate service.VH_StorageLocation with {
    Plant @title : 'Plant';
    StorageLocation @title : 'Storage Location';
    StorageLocationName @title : 'Storage Location Name';
};

annotate service.VH_StorageLocation with @(
    UI.SelectionFields  : [
        Plant
    ]
);

