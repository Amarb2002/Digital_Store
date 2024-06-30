       document.addEventListener('DOMContentLoaded', () => {
            const contacts = document.querySelectorAll('.contact');
            const chatHeader = document.querySelector('.chat-header');
            const chatName = chatHeader.querySelector('.chat-name');
            const chatAvatar = chatHeader.querySelector('.chat-avatar');
            const chatMessages = document.querySelector('.chat-messages');
            const input = document.querySelector('.chat-input input');
            const button = document.querySelector('.chat-input button');

            contacts.forEach(contact => {
                contact.addEventListener('click', () => {
                    const name = contact.getAttribute('data-name');
                    const avatar = contact.getAttribute('data-avatar');
                    const status = contact.getAttribute('data-status');

                    chatName.textContent = `Chat with ${name}`;
                    chatAvatar.src = avatar;
                    chatAvatar.alt = name;
                    chatMessages.innerHTML = ''; // Clear previous messages

                    // Add an example message for the selected contact
                    const messageElement = document.createElement('div');
                    messageElement.classList.add('message', 'received');
                    messageElement.innerHTML = `<p class="bg-light p-2 rounded">Hi, this is ${name}.</p><span class="time text-muted">8:40 AM, Today</span>`;
                    chatMessages.appendChild(messageElement);
                });
            });

            button.addEventListener('click', () => {
                const message = input.value.trim();
                if (message) {
                    const messageElement = document.createElement('div');
                    messageElement.classList.add('message', 'sent', 'text-right');
                    messageElement.innerHTML = `<p class="bg-success text-white p-2 rounded">${message}</p><span class="time text-muted">${new Date().toLocaleTimeString()}</span>`;
                    chatMessages.appendChild(messageElement);
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                    input.value = '';
                }
            });

            input.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    button.click();
                }
            });
        });