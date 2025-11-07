using {PurchaseOrder as service} from '../services';

using from './annotations-purchaseorderitem';

annotate service.PurchaseOrder with {
    PurchaseOrder          @title: 'Purchase Order';
    CompanyCode            @title: 'Company Code';
    PurchasingOrganization @title: 'Purchasing Organization';
    PurchasingGroup        @title: 'Purchasing Group';
    PurchaseOrderType      @title: 'Purchase Order Type';
    PurchaseOrderDate      @title: 'Purchase Order Date';
    Supplier               @title: 'Supplier';
    Language               @title: 'Language';
    DocumentCurrency       @title: 'Currency';
    PurchaseOrderStatus    @title: 'Purchase Order Status';
};

annotate service.PurchaseOrder with {
    CompanyCode @Common: {
        Text     : CompanyCode.CompanyCodeName,
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Company',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: CompanyCode_CompanyCode,
                ValueListProperty: 'CompanyCode'
            }]
        }
    }
};


annotate service.PurchaseOrder with @(
    UI.SelectionFields          : [
        PurchaseOrder,
        CompanyCode_CompanyCode,
        PurchasingOrganization,
        Supplier,
        PurchasingGroup,
        PurchaseOrderType,
        Language_code,
        DocumentCurrency_code,
        PurchaseOrderStatus_code
    ],
    UI.HeaderInfo               : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: PurchaseOrder
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: PurchaseOrderDate
        }
    },
    UI.LineItem                 : [
        {
            $Type: 'UI.DataField',
            Value: PurchaseOrder
        },
        {
            $Type             : 'UI.DataField',
            Value             : CompanyCode_CompanyCode,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '8rem'
            }
        },
        {
            $Type             : 'UI.DataField',
            Value             : PurchasingOrganization,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '12rem'
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : PurchasingGroup,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem'
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Supplier
        },
        {
            $Type             : 'UI.DataField',
            Value             : PurchaseOrderDate,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '12rem'
            }
        },
        {
            $Type             : 'UI.DataField',
            Value             : PurchaseOrderStatus_code,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem'
            }
        }
    ],
    UI.FieldGroup #PurchaseOrder: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrder
            },
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrderDate,
                Label: 'Order Date'
            }
        ]
    },
    UI.FieldGroup #Organization : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CompanyCode_CompanyCode
            },
            {
                $Type: 'UI.DataField',
                Value: PurchasingOrganization
            },
            {
                $Type: 'UI.DataField',
                Value: Supplier
            },
            {
                $Type: 'UI.DataField',
                Value: PurchasingGroup
            },
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrderType
            }
        ]
    },
    UI.FieldGroup #Other        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: DocumentCurrency_code
            },
            {
                $Type: 'UI.DataField',
                Value: Language_code
            }
        ]
    },
    UI.Facets                   : [
        {
            $Type : 'UI.CollectionFacet',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#PurchaseOrder',
                    Label : 'Purchase Order Information'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#Organization',
                    Label : 'Organization Information'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#Other',
                    Label : 'Currency and Language'
                }
            ],
            Label : 'General Information'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'to_PurchaseOrderItem/@UI.LineItem',
            Label : 'Purchase Order Items'
        }
    ]
);
