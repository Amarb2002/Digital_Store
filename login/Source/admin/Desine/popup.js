 // Get references to the button and popup div
    const openButton = document.getElementById('openPopup');
    const popupDiv = document.getElementById('popupDiv');
    const closeButton = document.getElementById('closePopup');

    // Function to open the popup
    function openPopup() {
        popupDiv.style.display = 'block';
    }

    // Function to close the popup
    function closePopup() {
        popupDiv.style.display = 'none';
    }

    // Event listener for the open button
    openButton.addEventListener('click', openPopup);

    // Event listener for the close button
    closeButton.addEventListener('click', closePopup);