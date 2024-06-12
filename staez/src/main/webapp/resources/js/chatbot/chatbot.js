async function getRecommendation() {
    const genre = document.getElementById('genre').value;
    const preferences = document.getElementById('preferences');
    
    if (!genre || !preferences.value) {
        alert("Please enter both your preferred genre and preferences.");
        return;
    }

    const prompt = `I like ${genre} and my requests are: ${preferences.value}`;
    createQueryUI(preferences.value);
    preferences.value = "";

    const response = await fetch('https://api.openai.com/v1/chat/completions', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${API_KEY}`
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",
            messages: [
                {
                    role: "system",
                    content: `Be sure to recommend 5 things. Recommend according to genre. Remove all explanations and reasons. Please wrap one data with <p> tag.`
                },
                {
                    role: "user",
                    content: prompt
                }
            ],
            max_tokens: 150
        })
    });

    if (!response.ok) {
        document.getElementById('recommendation').innerText = "Failed to fetch recommendations. Please try again.";
        return;
    }

    const data = await response.json();
    const recommendation = data.choices[0].message.content.trim();

    createAnsUI(recommendation);
}

function createQueryUI(preferences) {
    const modalContent = document.getElementById('chatbot-modal-content');

    const div = document.createElement('div');
    const message = document.createElement('div');
    message.setAttribute("class", "chatbot-query");
    message.innerHTML = preferences;

    div.appendChild(message);
    modalContent.appendChild(div);

    div.style.display = "flex";
    div.style.justifyContent = "flex-end";
}

function createAnsUI(recommendation) {
    const modalContent = document.getElementById('chatbot-modal-content');

    const div = document.createElement('div');
    const message = document.createElement('div');
    message.setAttribute("class", "chatbot-ans")
    message.innerHTML = recommendation;

    div.appendChild(message);
    modalContent.appendChild(div);

    div.style.display = "flex";
    div.style.justifyContent = "flex-start";
}

function chatModalToggle() {
    const modal = document.getElementById("chatbot-modal");
    modal.classList.toggle("hidden");
}