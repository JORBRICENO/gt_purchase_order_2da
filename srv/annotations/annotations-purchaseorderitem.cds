using {PurchaseOrder as service} from '../services';

annotate service.PurchaseOrderItem with {
    PurchaseOrderItem          @title: 'Purchase Otrder Item';
    PurchaseOrderItemText      @title: 'Purchase Order Item Text';
    Plant                      @title: 'Plant';
    StorageLocation            @title: 'Storage Location';
    Material                   @title: 'Material';
    MaterialGroup              @title: 'Material Group';
    ProductType                @title: 'Product Type';
    OrderQuantity              @title: 'Order Quantity'                @Measures.Unit       : OrderPriceUnit;
    OrderPriceUnit             @title: 'Order Price Unit'              @Common.IsUnit;
    NetPriceAmount             @title: 'Net Price Amount'              @Measures.ISOCurrency: DocumentCurrency;
    NetPriceQuantity           @title: 'Net Price Quantity'            @Measures.Unit       : PurchaseOrderQuantityUnit;
    DocumentCurrency           @title: 'Currency'                      @Common.IsCurrency;
    PurchaseOrderQuantityUnit  @title: 'Purchase Order Quantity Unit'  @Common.IsUnit;
    TaxCode                    @title: 'Tax Code';
    PurchasingInfoRecord       @title: 'Purchasing Info Record';
};

annotate service.PurchaseOrderItem with {
    Plant                     @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_Plant',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: PurchaseOrder.CompanyCode_CompanyCode,
                ValueListProperty: 'CompanyCode'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: Plant_Plant,
                ValueListProperty: 'Plant'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: PlantName,
                ValueListProperty: 'PlantName'
            },
        // {
        //     $Type            : 'Common.ValueListParameterDisplayOnly',
        //     ValueListProperty: 'CompanyCode'
        // }
        ]
    }};
    StorageLocation           @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_StorageLocation',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: Plant_Plant,
                ValueListProperty: 'Plant'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: StorageLocation_StorageLocation,
                ValueListProperty: 'StorageLocation'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: StorageLocationName,
                ValueListProperty: 'StorageLocationName'
            }
        ]
    }};
    OrderPriceUnit            @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_UnitMeasure',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: OrderPriceUnit_BaseUnit,
            ValueListProperty: 'BaseUnit'
        }]
    }};
    PurchaseOrderQuantityUnit @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_UnitMeasure',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: PurchaseOrderQuantityUnit_BaseUnit,
            ValueListProperty: 'BaseUnit'
        }]
    }}
};


annotate service.PurchaseOrderItem with @(
    UI.HeaderInfo                   : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: Material
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: PurchaseOrder.PurchaseOrder
        }
    },
    UI.LineItem                     : [
        {
            $Type             : 'UI.DataField',
            Value             : PurchaseOrderItem,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem'
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : Plant_Plant,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '6rem'
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : StorageLocation_StorageLocation,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem'
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Material
        },
        {
            $Type: 'UI.DataField',
            Value: OrderQuantity
        },
        {
            $Type: 'UI.DataField',
            Value: NetPriceAmount
        },
        {
            $Type: 'UI.DataField',
            Value: NetPriceQuantity
        }
    ],
    UI.FieldGroup #PurchaseOrderItem: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrderItem
            },
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrderItemText
            }
        ]
    },
    UI.FieldGroup #DeliveryDate     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Plant_Plant
            },
            {
                $Type: 'UI.DataField',
                Value: StorageLocation_StorageLocation
            }
        ]
    },
    UI.FieldGroup #MaterialDetails  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Material
            },
            {
                $Type: 'UI.DataField',
                Value: MaterialGroup
            },
            {
                $Type: 'UI.DataField',
                Value: ProductType
            }
        ]
    },
    UI.FieldGroup #QuantiyandPrice  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OrderQuantity
            },
            {
                $Type: 'UI.DataField',
                Value: OrderPriceUnit_BaseUnit,
            },
            {
                $Type: 'UI.DataField',
                Value: NetPriceAmount
            },
            {
                $Type: 'UI.DataField',
                Value: DocumentCurrency_code,
            },
            {
                $Type: 'UI.DataField',
                Value: NetPriceQuantity
            },
            {
                $Type: 'UI.DataField',
                Value: PurchaseOrderQuantityUnit_BaseUnit,
            }
        ]
    },
    UI.Facets                       : [{
        $Type : 'UI.CollectionFacet',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#PurchaseOrderItem',
                Label : 'Purchase Order Item Information'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#DeliveryDate',
                Label : 'Delivery Date'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#MaterialDetails',
                Label : 'Material Details'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#QuantiyandPrice',
                Label : 'Quantity and Price'
            }
        ],
        Label : 'General Information'
    }]
);
