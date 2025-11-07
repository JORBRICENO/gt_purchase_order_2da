const cds = require('@sap/cds');

module.exports = class PurchaseOrder extends cds.ApplicationService {

    async init () {

        const {VH_Company} = this.entities;

        const api_company = await cds.connect.to("API_COMPANYCODE_SRV");

        //before, on, after

        this.on('READ', VH_Company, async (req) => {
            return await api_company.tx(req).send({
                query: req.query, // SELECT * FROM A_CompanyCode;
                headers: {
                    apikey: process.env.APIKEY
                }
            })
        });


        return super.init();
    }

};