using {PurchaseOrder as service} from '../services';

annotate service.VH_PurchasingOrg with {
    PurchasingOrganization @title : 'Purchasing Organization' @Common: {
        Text : PurchasingOrganizationName,
        TextArrangement : #TextFirst
    }
};
