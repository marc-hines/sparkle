Ext.define('Sparkle.Application', {
    name: 'Sparkle',

    extend: 'Ext.app.Application',

    requires: [
        'Ext.data.proxy.Rest'
    ],

    views: [
        'window.LoginWindow',
        'ViewportHeaderView',
        'ViewportTabView',
        'ViewportMenuView',
        'user.UserActiveGridView',
        'user.UserDeletedGridView',
        'job.JobGridPanel',
        'job.JobActiveGridView',
        'job.JobDeletedGridView',
        'job.JobForCustomerView',
        'job.JobEditPanel',
        'job.JobEditView',
        'jobcode.JobcodeActiveGridView',
        'jobcode.JobcodeDeletedGridView',
        'message.MessageActiveGridView',
        'message.MessageDeletedGridView',
        'customer.CustomerActiveGridView',
        'customer.CustomerDeletedGridView',
        'customer.CustomerActiveGridView',
        'customer.CustomerEditPanel',
        'customer.CustomerEditView',
        'receivables.ReceivablesGridView',
        'receivables.CollectionGridView',
        'receivables.CollectionSummaryGridView',
        'receivables.ReceivablesCustomerEditPanel',
        'search.MainSearchView',
        'widget.TextArea'
    ],

    controllers: [
        'MainController',
        'UserActiveGridController',
        'JobcodeActiveGridController',
        'MessageActiveGridController'
    ],

    stores: [
        'JobFrequencyStore',
        'InvoiceFrequencyStore',
        'InvoiceBehaviorStore',
        'MessageStore'
    ]
});
