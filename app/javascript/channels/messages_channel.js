import consumer from "channels/consumer"

if (document.querySelector("#messages-block") != null) {
  consumer.subscriptions.create({channel: "MessagesChannel", id: document.querySelector("#room-id").innerHTML}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      document.querySelector("#messages-block").innerHTML += `
        <h3>${data}</h3>
      `
    }
  });
}