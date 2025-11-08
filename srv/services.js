const cds = require('@sap/cds');

module.exports = class PurchaseOrder extends cds.ApplicationService {

    async init () {

        const {
            VH_Company,
            VH_PurchasingOrg,
            VH_PurchasingGroup,
            VH_PurchaseOrderType
        } = this.entities;

        const api_company = await cds.connect.to("API_COMPANYCODE_SRV");
        const api_purchasingorg = await cds.connect.to("CE_PURCHASINGORGANIZATION_0001");
        const api_purchasinggroup = await cds.connect.to("CE_PURCHASINGGROUP_0001");
        const api_purchaseordertype = await cds.connect.to("ZPURCHASEORDERTYPE_READ");

        this.on('READ', VH_Company, async (req) => {
            return await api_company.tx(req).send({
                query: req.query,
                headers: {
                    apikey: process.env.APIKEY
                }
            })
        });

        this.on('READ', VH_PurchasingOrg, async (req) => {
            return await api_purchasingorg.tx(req).send({
                query: req.query, 
                headers: {
                    apikey: process.env.APIKEY
                }
            })
        });


        this.on('READ', VH_PurchasingGroup, async (req) => {
            return await api_purchasinggroup.tx(req).send({
                query: req.query, 
                headers: {
                    apikey: process.env.APIKEY
                }
            })
        });

        this.on('READ', VH_PurchaseOrderType, async (req) => {
            return await api_purchaseordertype.tx(req).send({
                query: req.query, 
                headers: {
                    Authorization: process.env.AUTHORIZATION
                }
            })
        });

        return super.init();
    }

};