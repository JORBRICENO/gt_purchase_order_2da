using {com.globaltalent.purchaseorders as entities} from '../db/schema';

/**
 * Remote Services
 */

 using {API_COMPANYCODE_SRV as Company} from './external/API_COMPANYCODE_SRV';

service PurchaseOrder {

    entity PurchaseOrder as projection on entities.PurchaseOrderHeader;
    entity PurchaseOrderItem as projection on entities.PurchaseOrderItem;

    /**
     * Value Help - VH_
     */
     @readonly
     @cds.persistence.exists
     @cds.persistence.skip
     entity VH_Company as projection on Company.A_CompanyCode {
        key CompanyCode,
            CompanyCodeName
     };
}