import consumer from "channels/consumer"

consumer.subscriptions.create("ConversionChannel", {
  connected() {
    console.log('connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var i = 0
    for(i = 0; i < data.length; i++){
      var id = data[i]['id'];
      var rate = data[i]['rate'];
      document.getElementById("rate_"+id).innerHTML = rate;
    }
  }
});
