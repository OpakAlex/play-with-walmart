import Ember from 'ember';

export default Ember.Controller.extend({
  keyword: '',
  productId: '',
  isError: false,

  actions: {
    search: function(){
      this.setProperties({searchResult: null, isError: false, isEmpty: false})
      Ember.$.ajax({
        dataType: "json",
        contentType: "application/json",
        url: `http://localhost:3000/api/v1/search?product_id=${this.get('productId')}&keyword=${this.get('keyword')}`,
        type: 'GET'
      }).then((data) => {
        this.set('isEmpty', data.length === 0);
        this.set('searchResult', data);
      }, () => {
        this.set('isError', true)
      });
    }
  }
});
