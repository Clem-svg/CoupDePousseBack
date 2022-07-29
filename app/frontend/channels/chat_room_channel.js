import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chat_room_element = document.getElementById('chat_room-id');
  const chat_room_id = chat_room_element.getAttribute('data-chat_room-id');

  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: chat_room_id }, {
    connected() {
      console.log("connected to " + chat_room_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      let html = data.html
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html
    }
  });
})
