using {PurchaseOrder as service} from '../services';

annotate service.VH_PurchasingGroup with {
    PurchasingGroup @title : 'Purchasing Group' @Common: {
        Text : PurchasingGroupName,
        TextArrangement : #TextFirst
    }
};
