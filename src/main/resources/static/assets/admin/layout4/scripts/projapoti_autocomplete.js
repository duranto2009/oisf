function getBaseUrl() {
    return js_wb_root;
}
var ProjapotiAutocomplete = function () {
	
    var handleTwitterTypeahead = function(data_url) {

        // Example #1
        // instantiate the bloodhound suggestion engine
        var numbers = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.num); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          local: [
            { num: 'metronic' },
            { num: 'keenthemes' },
            { num: 'metronic theme' },
            { num: 'metronic template' },
            { num: 'keenthemes team' }
          ]
        });
         
        // initialize the bloodhound suggestion engine
        numbers.initialize();
         
        // instantiate the typeahead UI
        if (Metronic.isRTL()) {
          $('.typeahead_example_1').attr("dir", "rtl");  
        }
        $('.typeahead_example_1').typeahead(null, {
          displayKey: 'num',
          hint: (Metronic.isRTL() ? false : true),
          source: numbers.ttAdapter()
        });

        // Example #2
        var countries = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          limit: 10,
          prefetch: {
            url: getBaseUrl()+'_templates/admin/angularjs/demo/typeahead_countries.json',
            filter: function(list) {
              return $.map(list, function(country) { return { name: country }; });
            }
          }
        });
 
        countries.initialize();
         
        if (Metronic.isRTL()) {
          $('.typeahead_example_2').attr("dir", "rtl");  
        } 
        $('.typeahead_example_2').typeahead(null, {
          name: 'typeahead_example_2',
          displayKey: 'name',
          hint: (Metronic.isRTL() ? false : true),
          source: countries.ttAdapter()
        });

        // Example #3
        var custom = new Bloodhound({
          datumTokenizer: function(d) { return d.tokens; },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          remote: getBaseUrl()+data_url+'?search_key=%QUERY'
        });
         
        custom.initialize();
         
        if (Metronic.isRTL()) {
          $('.typeahead_example_3').attr("dir", "rtl");  
        }  
        $('.typeahead_example_3').typeahead(null, {
          name: 'datypeahead_example_3',
          displayKey: 'value',
          source: custom.ttAdapter(),
          hint: (Metronic.isRTL() ? false : true),
          templates: {
            suggestion: Handlebars.compile([
              '<div class="media">',
                    '<div class="media-body">',
                        '<h4 class="media-heading">{{value}}</h4>',
                    '</div>',
              '</div>',
            ].join(''))
          }
        });

        // Example #4

        var nba = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.team); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: getBaseUrl()+'_templates/admin/angularjs/demo/typeahead_nba.json'
        });
         
        var nhl = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.team); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: getBaseUrl()+'_templates/admin/angularjs/demo/typeahead_nhl.json'
        });
         
        nba.initialize();
        nhl.initialize();
         
        if (Metronic.isRTL()) {
          $('.typeahead_example_4').attr("dir", "rtl");  
        }
        $('.typeahead_example_4').typeahead({
          hint: (Metronic.isRTL() ? false : true),
          highlight: true
        },
        {
          name: 'nba',
          displayKey: 'team',
          source: nba.ttAdapter(),
          templates: {
                header: '<h3>NBA Teams</h3>'
          }
        },
        {
          name: 'nhl',
          displayKey: 'team',
          source: nhl.ttAdapter(),
          templates: {
                header: '<h3>NHL Teams</h3>'
          }
        });

    };

    

    return {
        //main function to initiate the module
        init: function (data_url) {
            //handleTwitterTypeahead(data_url);
        }
    };

}();