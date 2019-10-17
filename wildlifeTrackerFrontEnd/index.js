// Global variables
    let currentUserId = ''
    const allAnimals = []
// links
    const animalURL = 'http://localhost:3000/animals'
    const addAnimalsURL = 'http://localhost:3000/addAnimal'
    const removeAnimalURL = 'http://localhost:3000/removeAnimal/'
    const userAnimalsURL = `http://localhost:3000/users/${currentUserId}`

// Button Elements
    const mammalsButton = document.createElement("button")
    mammalsButton.id = "mammalsButton"
    const reptilesButton = document.createElement("button")
    reptilesButton.id = "reptilesButton"
    const birdsButton = document.createElement("button")
    birdsButton.id = "birdsButton"
    const homeButton = document.querySelector("#home")
    const buttonContainer = document.createElement("div")
    buttonContainer.className = "buttonContainer"

// Document Elements
    const categories = document.querySelector(".categories")
    const animalContainer = document.createElement('div')
    animalContainer.className = "animalContainer"
    const userAnimalContainer = document.createElement('div')
    userAnimalContainer.className= "userAnimalContainer"
    const userInfo = document.querySelector(".userInfo")
    const flipCardContainer = document.createElement('div')
    flipCardContainer.className = "flip-card-container"
    const signUpForm = document.querySelector('.signUpForm')
    logInForm = document.querySelector(".loginForm")
    const homeTitle = document.createElement("p")
    homeTitle.className = "HomePageTitle"
    formContainer = document.createElement('div')
    formContainer.className = 'form-container'
    formContainer.append(signUpForm, logInForm)
    document.body.append(formContainer)

// card elements
    // let animalCard = document.createElement('div')
    let commonName = document.createElement('h1')
    let scientificName = document.createElement('h4')
    let category = document.createElement('h5')
    let description = document.createElement('p')
    let approachable = document.createElement('p')
    let status = document.createElement('h6')
    let image = document.createElement('img')


// button functions

function buttons(buttonContainer){
    buttonContainer.addEventListener('click', event => {
        console.log(event)
        const buttonId = event.target.id
        if (buttonId === 'mammalsButton') {
            showCardCategories('Mammal')
            } else if (buttonId === 'reptilesButton') {
                showCardCategories('Reptile')
            } else if (buttonId === 'birdsButton') {
                showCardCategories('Bird')
            }
    })
}

homeButton.addEventListener("click", event => {
    console.log(event)
    categories.innerText = ' '
    animalContainer.innerText = ''
    userInfo.innerText = ''
    showHomePage()
    categories.style.display = 'flex'
})

// Create User and Login/logout
function signUp(){
    homeButton.style.display = "none"
    signUpInstructions = document.querySelector('.instructions')
    signUpInstructions.innerText = "Create a username and password to sign up"
    signUpTitle = document.querySelector('.newUserTitle')
    signUpTitle.innerText = "New User Sign Up"
    signUpForm.addEventListener('submit', event => {
        event.preventDefault()
        let formData = new FormData(signUpForm)
        let username = formData.get('username')
        let password = formData.get('password')

        user = {
            username,
            password
        }

        createUser(user)
        signUpForm.style.display = "none"
    }) 
}

function createUser(user){
    console.log("madeit")
    fetch('http://localhost:3000/users', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({user})
    }).then(response => response.json())
        .then(result => result.errors ? signUpError(result.errors) : logIn())
}

function signUpError(message){
    alert(message)
    showSignUpLogIn()
}

function logIn(){
    loginInstructions = document.querySelector('.LoginInstructions')
    loginInstructions.innerText = "Enter your username and password to login"
    currentUserTitle = document.querySelector('.currentUserTitle')
    currentUserTitle.innerText = "Current User Login"
    logInForm.addEventListener('submit', event => { 
        event.preventDefault()
        let formData = new FormData(logInForm)
        let username = formData.get('username')
        let password = formData.get('password')

        user = {
            username,
            password
        }

        checkLogIn(user)
        logInForm.style.display = 'none'
        signUpForm.style.display = 'none'
    })
}

function checkLogIn(user){
    fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
            'Authorization': 'Bearer',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify ({user})
    }).then(response => response.json())
        .then(result => result.message ? logInError(result.message) : logInWork(result.user.id,'jwt', result.jwt))
}

function logInError(message){
    alert(message)
    showSignUpLogIn()
}

function logInWork(id, key, value){
    localStorage.setItem(key, value)
    currentUserId = id
    showHomePage()
}

function showSignUpLogIn(){
    signUpForm.style.display= 'block'
    logInForm.style.display ='block'
}


function logOut(){
    logOut = document.getElementById('logOut')
    logOut.addEventListener('click', event => {
        localStorage.removeItem('jwt')
        showSignUpLogIn()
        buttonContainer.style.display = "none"
        homeTitle.style.display = "none"
        userInfo.style.display = "none"

    }) 
    
}

// Home Page functions

function showHomePage(){
    homeTitle.innerText = "What did you see?"
    mammalsButton.innerText = "Mammals"
    reptilesButton.innerText = "Reptiles"
    birdsButton.innerText = "Birds" 

    buttonContainer.append(mammalsButton, reptilesButton, birdsButton)
    buttons(buttonContainer)
    categories.append(homeTitle, buttonContainer)
    document.body.append(categories)
} 

function showCardCategories(category) {
    animalContainer.innerText = ''
    const filteredCategories = allAnimals.flat().filter(animal => {
        return animal.category === category
    })
    filteredCategories.forEach(createCards)
}

function createCards(animal) {
    const animalCard = document.createElement('div')
    const commonName = document.createElement('h1')
    const scientificName = document.createElement('h4')
    const category = document.createElement('h5')
    const description = document.createElement('p')
    const approachable = document.createElement('p')
    const status = document.createElement('h6')
    const image = document.createElement('img')
    const addAnimalButton = document.createElement('button')

    animalCard.className = "animal-card"
    addAnimalButton.className = "add-animal-button"

    commonName.innerText = animal.common_name
    scientificName.innerText = 'Scientific Name: ' + animal.scientific_name
    category.innerText = 'Category: ' + animal.category
    description.innerText = animal.description
    approachable.innerText = animal.approachable
    status.innerText = animal.status
    image.src = animal.image
    addAnimalButton.innerText = "Add Animal"

    addAnimalButton.addEventListener('click',event => {
        console.log(event)
        const animalToAdd = event.target.parentNode
        fetch(addAnimalsURL, {
            method: 'POST',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwt'),
                'Content-Type': 'application/json'
            }, 
            body: JSON.stringify(
                {
                    user_id: currentUserId,  
                    animal_id: animal.id
                }
            )
        }).then(setTimeout(showUserPage, 1000))
    })

    animalCard.appendChild(image)
    animalCard.append(commonName, scientificName,category, description, approachable, addAnimalButton)
    animalContainer.append(animalCard)
    document.body.appendChild(animalContainer)
}

// User page
function showUserPage() {
    fetch(userAnimalsURL, {
        method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwt'),
                'Content-Type': 'application/json'
            }
    })
    .then(response => response.json())
    .then(response => {
        response.forEach(user => {
            if(user.id == currentUserId){
                animalContainer.innerText = ''
                user.animals.forEach(animal => {
                createUserCards(animal)  
                })
                categories.style.display = "none"
            }
        })
    }) 
    
    const userTitle = document.createElement('h2')
    userTitle.className = "userTitle"
    userTitle.innerText = "Animal's You've Seen!"
    
    let map = document.getElementById("googleMap")
    map.style.display= "block"

    const mapTitle = document.createElement('h2')
    mapTitle.className ='mapTitle'
    mapTitle.innerText= "Mark the Sighting!"

    map.prepend(mapTitle)
    userInfo.append(map, userTitle)
    document.body.append(userInfo)
} 


function createUserCards(animal){
    const userFlipCard = document.createElement('div')
    userFlipCard.className = "flip-card"
    const userFlipCardInner = document.createElement('div')
    userFlipCardInner.className = "flip-card-inner"
    const userFlipCardFront = document.createElement('div')
    userFlipCardFront.className = "flip-card-front"
    const userFlipCardBack = document.createElement('div')
    userFlipCardBack.className = "flip-card-back"
    const commonName = document.createElement('h1') 
    const scientificName = document.createElement('h4')
    const category = document.createElement('h5')
    const approachable = document.createElement('p')
    const status = document.createElement('h6')
    const image = document.createElement('img')
    const removeAnimalButton = document.createElement('button')

    removeAnimalButton.addEventListener('click',event => { 
        const animalToRemove = userFlipCard
        console.log(animalToRemove)
        fetch(removeAnimalURL + animal.id, {
            method: 'DELETE',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwt'),
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(
                {
                    user_id: currentUserId,  
                    animal_id: animal.id
                }
            )
        }).then(animalToRemove.remove())
    })

    removeAnimalButton.innerText = "Remove Animal"
    commonName.innerText = animal.common_name
    scientificName.innerText = 'Scientific Name: ' + animal.scientific_name
    category.innerText = 'Category: ' + animal.category
    approachable.innerText = animal.approachable
    status.innerText = animal.status
    image.src = animal.image

    userFlipCardFront.append(commonName, image)
    userFlipCardBack.append(scientificName, category, approachable, removeAnimalButton)
    userFlipCardInner.append(userFlipCardFront, userFlipCardBack)
    userFlipCard.append(userFlipCardInner)
    flipCardContainer.append(userFlipCard)
    userInfo.append(flipCardContainer)
    document.body.append(userInfo)
}
// fetch animals
function retrieveAnimals() {
    fetch(animalURL)
        .then(response => response.json())
        .then(animals => {allAnimals.push(animals)
        })
}

initMap()
logIn()
logOut()
signUp() 
retrieveAnimals()





