Ext.define('Sparkle.view.job.JobEditPanel', {
    extend: 'Ext.form.Panel',
    
    requires: [
        'Ext.form.*',
        'Sparkle.model.JobModel',
        'Ext.layout.container.Absolute'
    ],
    
    xtype: 'app-job-edit-panel',
    
    customerDbid: null,
    
    title: 'Job Information',
    layout: {
        type: 'absolute'
    },
    autoScroll: true,
    
    initComponent: function() {

        me = this;

        Ext.apply(me, {

            items: [{

                xtype:'fieldset',
                title: 'Job Address',
                x: 10,
                y: 5,
                maxWidth: 450,
                minWidth: 450,
                maxHeight: 280,
                minHeight: 280,
                layout: {
                    type: 'absolute'
                },
                items: [{

                    xtype: 'textfield',
                    x: 5,
                    y: 5,
                    width: 200,
                    fieldLabel: 'Job ID',
                    labelAlign: 'right',
                    labelWidth: 70,
                    allowBlank: false,
                    name: 'job_id'                            
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 35,
                    width: 360,
                    fieldLabel: 'Name',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_name'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 65,
                    width: 360,
                    fieldLabel: 'Address 1',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_addr1',
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 95,
                    width: 360,
                    fieldLabel: 'Address 2',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_addr2',
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 125,
                    width: 250,
                    fieldLabel: 'City',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_city'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 155,
                    width: 250,
                    fieldLabel: 'State',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_state'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 185,
                    width: 250,
                    fieldLabel: 'Zip',
                    labelAlign: 'right',
                    labelWidth: 70,
                    name: 'job_zip'

                }]
            },
            {
                xtype:'fieldset',
                title: 'Contact',
                flex: 1,
                x: 500,
                y: 5,
                maxWidth: 450,
                minWidth: 450,
                maxHeight: 280,
                minHeight: 280,
                layout: {
                    type: 'absolute'
                },
                items: [{

                    xtype: 'textfield',
                    x: 5,
                    y: 5,
                    width: 140,
                    fieldLabel: 'Phone 1',
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'Desc',
                    name: 'job_phone1_desc'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 5,
                    width: 170,
                    fieldLabel: 'Phone1',
                    hideLabel: true,
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: '999.999.9999',
                    name: 'job_phone1'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 35,
                    width: 140,
                    fieldLabel: 'Phone 2',
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'Desc',
                    name: 'job_phone2_desc'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 35,
                    width: 170,
                    fieldLabel: 'Phone1',
                    hideLabel: true,
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: '999.999.9999',
                    name: 'job_phone2'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 65,
                    width: 140,
                    fieldLabel: 'Phone 3',
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'Desc',
                    name: 'job_phone3_desc'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 65,
                    width: 170,
                    fieldLabel: 'Phone1',
                    hideLabel: true,
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: '999.999.9999',
                    name: 'job_phone3'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 115,
                    width: 140,
                    fieldLabel: 'Email 1',
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'Desc',
                    name: 'job_email1_desc'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 115,
                    width: 230,
                    hideLabel: true,
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'someone@xyz.com',
                    name: 'job_email1'
                },
                {
                    xtype: 'textfield',
                    x: 5,
                    y: 145,
                    width: 140,
                    fieldLabel: 'Email 2',
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'Desc',
                    name: 'job_email2_desc'
                },
                {
                    xtype: 'textfield',
                    x: 150,
                    y: 145,
                    width: 230,
                    hideLabel: true,
                    labelAlign: 'right',
                    labelWidth: 70,
                    emptyText: 'someone@xyz.com',
                    name: 'job_email2'
                }]
            },
            {
                xtype:'fieldset',
                title: 'Invoicing',
                x: 10,
                y: 300,
                maxWidth: 450,
                minWidth: 450,
                maxHeight: 250,
                minHeight: 250,
                layout: {
                    type: 'absolute'
                },
                items: [{
                    xtype: 'combobox',
                    x: 5,
                    y: 35,
                    width: 420,
                    fieldLabel: 'Job Frequency',
                    labelAlign: 'right',
                    labelWidth: 122,
                    store: 'JobFrequencyStore',
                    queryMode: 'local',
                    displayField: 'job_frequency_id',
                    valueField: 'job_frequency_dbid',
                    name: 'job_job_frequency_dbid'

                }]
            },
            {
                xtype: 'app-text-area',
                x: 500,
                y: 290,
                height: 125,
                width: 450,
                grow: false,
                fieldLabel: 'Customer notes',
                labelAlign: 'top',
                name: 'job_notes'
            }],

            dockedItems: [{
                xtype: 'toolbar',
                dock: 'top',
                ui: 'footer',
                defaults: {xtype: 'button'},
                items: [{
                    text: 'Save Changes',
                    iconCls: 'icon-save',
                    itemId: 'CustomerEditSaveButton',
                    alight: 'left',
                    listeners: {
                        click: function() {
                            if (me.isValid()) {
                                me.updateRecord();
                            }
                        }
                    }
                },'-',{
                    text: 'Cancel Changes',
                    iconCls: 'icon-cancel',
                    itemId: 'CustomerEditCancelButton',
                    alight: 'left'
                },{
                    xtype: 'tbfill'
                },{
                    text: 'Delete Customer',
                    iconCls: 'icon-delete',
                    itemId: 'CustomerEditDeleteButton'
                }]
            }]

        });

        me.callParent();

        var jobEditStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-job-edit-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: false,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.JobModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/jobs/DBID::'+this.jobDbid,
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
        });

        jobEditStore.load({
            callback: function(records, options, success) {
                if (success) {
                    jobRecord = records[0];
                    me.loadRecord(jobRecord);
                }
            }
        });

    }
});
