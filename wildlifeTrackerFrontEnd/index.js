
document.addEventListener('DOMContentLoaded', () => {
    
    const allAnimals = []
    const addUserURL = 'http://localhost:3000/auth/login'
    const animalURL = 'http://localhost:3000/animals'
    const addAnimalsURL = 'http://localhost:3000/addAnimal'
    const removeAnimalURL = 'http://localhost:3000/removeAnimal/'
    const userAnimalsURL = 'http://localhost:3000/users/1'
    const mammalsButton = document.createElement("button")
    mammalsButton.id = "mammalsButton"
    const reptilesButton = document.createElement("button")
    reptilesButton.id = "reptilesButton"
    const birdsButton = document.createElement("button")
    birdsButton.id = "birdsButton"
    const homeButton = document.querySelector("#home")
    const categories = document.querySelector(".categories")
    const animalContainer = document.createElement('div')
    const userAnimalContainer = document.createElement('div')
    const userInfo = document.querySelector(".userInfo")
    const flipCardContainer = document.createElement('div')
    const signUpForm = document.querySelector('.signUpForm')
    
    flipCardContainer.className = "flip-card-container"
    animalContainer.className = "animalContainer"
    userAnimalContainer.className= "userAnimalContainer"

    
    // event listeners

    function showCardCategories(category) {
        animalContainer.innerText = ''
        const filteredCategories = allAnimals.flat().filter(animal => {
            return animal.category === category
        })
        filteredCategories.forEach(createCards)
    }

    function buttons(buttonContainer){
        buttonContainer.addEventListener('click', event => {
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

    // Show page functions
    
    function showUserPage() {
        fetch(userAnimalsURL)
        .then(response => response.json())
        .then(response => {
            animalContainer.innerText = ''
            response.animals.forEach(animal => {
                createUserCards(animal)  
            })
            console.log(response.animals)
            categories.style.display = "none"
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

    function retrieveAnimals() {
        fetch(animalURL)
            .then(response => response.json())
            .then(animals => {allAnimals.push(animals)
            })
    }

    function hideSignUp(){
        console.log('hidesignup')
        logInForm = document.querySelector(".loginForm")
        logInForm.style.display = "block"

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
            signUpForm.style.display = "block"
        }) 
    } 

    // signUpForm.addEventListener('submit', event => {
    //     event.preventDefault()
    //     let formData = new FormData(signUpForm)
    //     let username = formData.get('username')
    //     let password = formData.get('password_digest')

    //     user = {
    //         username,
    //         password
    //     }

    //     createUser(user)
    // }) 

    function createUser(user){
        console.log("madeit")
        fetch('http://localhost:3000/users', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({user})
        }).then(response => response.json())
            .then(result => result.errors ? alert(result.errors) : logIn())

    }

    function logIn(){
        logInForm = document.querySelector(".loginForm")
        logInForm.style.display = "block"
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
            .then(result => localStorage.setItem('jwt', result.jwt))
        // result.errors ? console.log(result.erros) : showHomePage()
    }



    function showHomePage(){
        console.log('homepagehere')
        const buttonContainer = document.createElement("div")
        buttonContainer.className = "buttonContainer"
        const p = document.createElement("p")

        
        p.innerText = "What did you see?"
        mammalsButton.innerText = "Mammals"
        reptilesButton.innerText = "Reptiles"
        birdsButton.innerText = "Birds" 
        
        buttonContainer.append(mammalsButton, reptilesButton, birdsButton)
        buttons(buttonContainer)
        categories.append(p, buttonContainer)
        document.body.append(categories)
    
    } 
    function createCards(animal) {
        console.log(animal)
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
                    'Content-Type': 'application/json'
                }, 
                body: JSON.stringify(
                    {
                        user_id: 1,  
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
        const description = document.createElement('p')
        const approachable = document.createElement('p')
        const status = document.createElement('h6')
        const image = document.createElement('img')
        const removeAnimalButton = document.createElement('button')

        removeAnimalButton.addEventListener('click',event => { 
            const animalToRemove = userFlipCard
            console.log(animalToRemove)
            fetch(removeAnimalURL + animal.id, {
                method: 'DELETE',
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
    initMap()
    logIn()
    // hideMap()
    hideSignUp() 
    retrieveAnimals()
})




