Ext.define('Sparkle.view.widget.TextArea', {
    extend:'Ext.form.field.TextArea',
    xtype: 'app-text-area',

    transformRawValue: function(value){
        var cleanValue = this.swapBreaksOut(value);
        return this.stripReturns(cleanValue);
    },
    
    transformOriginalValue: function(value){
        var cleanValue = this.swapBreaksOut(value);
        return this.stripReturns(cleanValue); 
    },
    
    getValue: function(){
        var cleanValue = this.swapBreaksIn(this.callParent());
        return this.stripReturns(cleanValue);    
    },
    
    valueToRaw: function(value){
        var cleanValue = this.swapBreaksIn(value);
        cleanValue = this.stripReturns(cleanValue);
        return this.callParent([cleanValue]);
    },
    
    swapBreaksIn: function(value){
        if (value && typeof value === 'string') {
            value = value.replace(/\n/g, '<br>');
        }
        return value;
    },

    swapBreaksOut: function(value){
        if (value && typeof value === 'string') {
            value = value.replace(/<br>/g, '\n');
        }
        return value;
    }

});