using {PurchaseOrder as service} from '../services';

annotate service.VH_Company with {
    @title: 'Companies'
    CompanyCode @Common: {
        Text           : CompanyCodeName,
        TextArrangement: #TextFirst
    }
};
