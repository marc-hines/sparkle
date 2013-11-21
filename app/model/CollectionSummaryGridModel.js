Ext.define('Sparkle.model.CollectionSummaryGridModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-collection-summary-grid-model',

    fields: [{
        name: 'customer_dbid', type: 'string'
    }, {
        name: 'customer_id', type: 'string'
    }, {
        name: 'customer_name', type: 'string'
    }, {
        name: 'view_invoice_count', type: 'number'
    }, {
        name: 'view_balance_31_45', type: 'number',
    }, {
        name: 'blank_balance_31_45', type: 'number',
        convert: function(value, record) {
            var value = record.get('view_balance_31_45')
            if (value == 0) {
                value = '';
            }
            return value;
        }
    }, {
        name: 'view_balance_46_60', type: 'number'
    }, {
        name: 'blank_balance_46_60', type: 'number',
        convert: function(value, record) {
            var value = record.get('view_balance_46_60')
            if (value == 0) {
                value = '';
            }
            return value;
        }
    }, {
        name: 'view_balance_61_90', type: 'number'
    }, {
        name: 'blank_balance_61_90', type: 'number',
        convert: function(value, record) {
            var value = record.get('view_balance_61_90')
            if (value == 0) {
                value = '';
            }
            return value;
        }
    }, {
        name: 'view_balance_over_90', type: 'number'
    }, {
        name: 'blank_balance_over_90', type: 'number',
        convert: function(value, record) {
            var value = record.get('view_balance_over_90')
            if (value == 0) {
                value = '';
            }
            return value;
        }
    }, {
        name: 'customer_notes', type: 'string'
    }, {
        name: 'customer_ar_notes', type: 'string'
    }, {
        name: 'view_total_overdue', type: 'number',
        convert: function(value, record) {
            var value = record.get('view_balance_31_45')
                      + record.get('view_balance_46_60')
                      + record.get('view_balance_61_90')
                      + record.get('view_balance_over_90');
            return value;
        }
    }]
});
