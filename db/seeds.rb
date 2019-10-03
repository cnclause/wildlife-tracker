# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Animal.destroy_all

bighorn_sheep = Animal.create(common_name: 'Bighorn Sheep', scientific_name: 'Ovis canadensis', category: 'Mammal', description: "The bighorn sheep is the mammalian symbol of Colorado Parks and Wildlife and Colorado's official animal. Colorado is home to the largest population of the species anywhere. The animals are five to six feet long with a tail three to six inches in length. Rams weigh 150-250 pounds, ewes 120-200. Males are about three feet high at the shoulder, ewes slightly less. Color is usually grayish brown, with a paler belly and a white rump patch. The massive, coiled horns of mature rams may make up to 10 percent of the body weight. Ewes have spike-like horns. Brooming is the term used to describe the chipping and fraying of horns, usually caused by fighting. Some brooming may be caused by accidents or digging. Rams achieve full curl at about seven or eight years of age. Usually, bighorn sheep are diurnal, being active during daylight and exhibit little nocturnal (nighttime) activity. Adult rams stay segregated from ewes, except during the rut. Young rams join bands of rams when they are two to three years old. Rams battle each other, cracking horns, to test dominance within the herd. Hunting bighorns is carefully regulated. Parasitic disease is common in bighorns. Coyotes, mountain lions and eagles prey on them, and some bighorns succumb to accidental falls.​", approachable: "Remember, at a distance, sheep often appear smaller than viewers expect. Wild sheep are wary of people on foot, especially of someone between them and their uphill escape route. They are often more tolerant of vehicles, so consider using your car as a viewing blind. Be sure to pull safely to the side of the Where road and out of traffic.", status: "N/A", image:"https://cpw.state.co.us/PublishingImages/WildlifeSpecies/SPList/BighornSheep01.jpg")
wolverine = Animal.create( common_name: 'Wolverine', scientific_name: 'Gulo gulo', category: 'Mammal', description: 'Wolverine have a reputation larger than life, but they are impressive weasels by any standard. Wolverine are three feet long, with a rather short tail, just one-quarter the total length. Otters are longer, but wolverines are the heaviest of weasels, tipping the scale at 20 to 30 pounds or more. They are stocky mammals, built like a small bear. Their fur is dark brown to black, and the sides have a characteristic yellowish brown to whitish stripe. Like other weasels, wolverine have anal musk-producing glands.', approachable: 'Wolverines are generally not aggressive towards humans, preferring to avoid any human contact. However, if you come into contact with a Wolverine, do not approach.', status: 'State Endagered', image: 'https://factanimal.com/wp-content/uploads/2018/09/wolverine-facts.jpg')
lynx = Animal.create(common_name: 'Lynx', scientific_name: 'Lynx canadensis', category: 'Mammal', description: 'The Colorado Parks and Wildlife’s lynx reintroduction program has been deemed a success! Read the lynx success press release and view a detailed summary of the program off the lynx research page.The lynx is a large, bob-tailed cat, three feet long with a black-tipped tail only about one-eighth the total length, and only about half the length of its huge hind foot. Weights are 20 – 30 pounds. The coat is grayish, with obscure spots. The magnificent ear tufts may be nearly as long as the actual ears.The lynx lives in North America and Eurasia. Lynx may have disappeared from Colorado by about 1973. Sightings prior to that time were few, scattered throughout mountainous areas of the state. In 1999 an ambitious program of lynx restoration began in the remote San Juan Mountains, and by 2005 more than 200 animals had been released. A number of Lynx paw prints where seen in the snow. Litters of kittens had been born, and lynx were expanding throughout the high country and occasionally beyond.The lynx is found in dense subalpine forest and willow-choked corridors along mountain streams and avalanche chutes, the home of its favored prey species, the snowshoe hare. The typical hunting strategy is patience, stalking prey or crouching in wait beside a trail. Often the surprised quarry is overtaken and dispatched in a single, furious bound. Lynx also eat some carrion, and capture ground-dwelling birds (like grouse) and small mammals. Lynx are active throughout the year; their huge hind feet help them move across heavy snow.', approachable: "Never approach the animal, especially if it's near a kill or with young. Try to appear as big as you can and do not run, turn your back, or take your eyes of the animal. If the abnimal does not flee, be more assertive by shouting, waiving your arms, and throwing anything available", status: 'Federally Threatened, State Endangered', image: 'https://cpw.state.co.us/PublishingImages/WildlifeSpecies/SPList/Lynx-in-Winter10.jpg')
moose = Animal.create(common_name: 'Moose', scientific_name: 'Alces alces', category: 'Mammal', description: 'Moose have wandered into Colorado occasionally, but there was no breeding population until animals were introduced to North Park from Utah and Wyoming in 1978 and 1979. Populations have expanded to nearby counties (and Rocky Mountain National Park), and animals have been transplanted to the Upper Rio Grande drainage, Grand Mesa, and the Flat Tops Wilderness. Individual moose may also wander widely from their usual mountain haunts, to the edge of the plains, for example, where they sometimes graze alongside cattle. Their body is covered with black or very dark brown hair. They have a very large head with a dewlap of skin, called a “bell,” hanging down from the jaw. Moose have very long legs so they can wade into a lake and eat plants off the bottom. Their legs enable them to paw through deep snow to reach food in winter. Moose are the largest deer; bulls range to 9 1⁄2 feet long (of which only four inches is tail), six feet tall at the shoulder, with weights to over 1,000 pounds. Antlers are “palmate”— flattened like a hand. Antlers of bulls in their prime may weigh over 50 pounds. Antler growth begins late winter with the formation of soft “velvet,” the blood-rich skin that nourishes antler growth. Velvet is rubbed off in fall in preparation for the breeding season. Moose are mainly found as singles or in small groups, not in large herds.', approachable: "Do not approach Moose, although they don't look threatening, they can become aggressive when disturbed. Moose are also very fast animals and can charge at speeds up to 35 miles per hour.", status: 'N/A', image: 'https://cpw.state.co.us/PublishingImages/WildlifeSpecies/SPList/Moose01.jpg')
coyote = Animal.create(common_name: 'Coyote', scientific_name: 'Canis latrans', category: 'Mammal', description: 'The coyote is the size and shape of a small shepherd dog, about four feet in length with a full, black-tipped tail about 14 inches long. Weights are 30 to 40 pounds. Their long hair varies in color with geography and season from pale grayish buff to rich reddish brown. The ears are rusty red behind. Coyotes may live up 20 years, but ten years is a rough average. In an extermination effort from 1915 to 1947, bounties were paid on 1,884,897 coyotes in the United States. Coyotes are managed as furbearers in Colorado.', approachable: 'Do not approach coyotes. If you come in contact with a coyote, try to scare it away by being loud or throwing sticks or small stones. Do not try to injure the animal, but scare it away and never run. Coyotes can target children and small animals so always be careful.', status: 'N/A', image: 'https://cpw.state.co.us/PublishingImages/WildlifeSpecies/SPList/Coyote01.jpg')
marmot = Animal.create(common_name: 'Yellow-Bellied Marmot', scientific_name: ' Marmota flaviventris', category: 'Mammal', description: 'The marmot is the largest of our ground squirrels, a close relative of the woodchuck of the East and Midwest. The yellow-bellied marmot is a heavy-set, grizzled brown animal with white patches on the chin and (as the name suggests) a yellowish belly. Marmots can be waddling fat in the fall, and their long fur makes them look even fatter. Adults are about 26 inches long and weigh up to about 11 pounds. Predators include the coyote, badger, bobcat, golden eagle, hawks, owls, weasels and marten. However, predation probably is a less important cause of mortality than is the stress of hibernation. Marmots are protected by a rocky habitat and a social system of alarm calls.', approachable: 'Marmots are harmless to people, however never get too close, feed, or disprupt the animals habitat.', status: 'N/A', image: 'https://cpw.state.co.us/PublishingImages/WildlifeSpecies/SPList/YellowBelliedMarmot01.jpg')

king_snake = Animal.create(common_name: 'Speckled Kingsnake', scientific_name: 'Lampropeltis holbrooki', category: 'Reptile', description: 'Upper scales smooth (unkeeled), black or dark brown, with either yellowish speckling or broad whitish or yellowish bands; single anal scale; usually two rows of scales on underside of tail; maximum total length about 183 cm (72 inches) but usually less than 100 cm (39 inches). Note: Under recent taxonomic proposals, Kingsnakes in Colorado have been split into two separate species, California Kingnsnake and Speckled Kingsnake.​', approachable: 'King snakes do not pose a threat to humans. While they can bite, they are not venomous.', status: 'State special concern', image: 'http://webapps.fhsu.edu/ksherp/images/herps/juv_lam_get_lincoln__Jim_Scharosch.jpg')
turtle = Animal.create(common_name: "Ornate Box Turtle", scientific_name: 'Terrapene ornata', category: 'Reptile', description: 'Identification: Upper shell hard, domed, dark with yellow streaks or spots; lower shell transversely hinged in adults, allowing the shell to be tightly closed; upper shell up to about 14.6 cm (5.7 inches) long. Mature male: Innermost toe of hind foot thick and turned inward; iris and spots on forelimbs usually reddish; rear portion of lower shell slightly concave; vent located beyond rear edge of upper shell when tail is extended. Mature female: Toe not turned inward; iris yellowish or brownish; spots on front legs yellowish; rear part of lower shell not concave; vent at or inside rear edge of upper shell. Juvenile: Upper shell with yellowish dots and a prominent stripe along the middle; hinge on lower shell not functional for the first few years of life. Hatchling: Upper shell round, average length generally 26–30 mm (1.0-1.2 inches), with yellow spots and a yellow stripe along the middle; lower shell yellowish or cream, with large dark blotch in middle.', approachable: 'Ornate box turtles are harmless to humans but please respect them and do not pick them up.', status: 'N/A', image: 'https://www.sdherps.org/media/315.jpg')
water_snake = Animal.create(common_name: 'Northern Watersnake', scientific_name: ' Nerodia sipedon', category: 'Reptile', description: 'Front portion of body crossbanded, rear portion crossbanded or blotched; pattern sometimes obscure, especially in large individuals; belly often with red or orange blotches; upper scales keeled, with a pair of tiny pits near the tip of each scale; anal scale divided; more than two scales between eye and nostril; maximum total length about 150 cm (59 inches), but very few in Colorado exceed 100 cm (39 inches); males usually less than 62 cm (24 inches) snout-vent length, females usually less than 82 cm (32 inches) snout-vent length; end of tail often missing.', approachable: 'The northern watersnake is non-venomous and harmless to humans.', image: 'http://www.snake-removal.com/northernwatersnake.jpg')
earless_lizard = Animal.create(common_name:"Common Lesser Earless Lizard" , scientific_name:"Holbrookia maculata" , category: "Reptile", description: "Upper side striped or speckled, with smooth granular scales; external ear openings absent; two black marks on each side of belly; total length up to about 13 cm (5.1 inches); adults average about 5 cm (2 inches) in snout-vent length. Mature male: Two enlarged scales on underside of tail just behind vent; black, blue-edged bars on belly; may have yellowish wash on sides. Mature female: Black bars on belly lack blue edge; reproductive females during the breeding season have yellow-orange on throat and on sides of head and neck and orange on sides of body. This diurnal lizard is most active mid morning and late afternoon during the hottest months of summer. It can be active throughout the daylight hours in spring and early fall. It hibernates during the cold months of winter and late fall. ", approachable:"View from a distance and respect their habitat. Do not try to catch them or chase them.", status:"N/A" , image:"http://www.reptilesofaz.org/Graphics/Lizards/HOLMAC-08c.jpg") 
yellow_turle = Animal.create(common_name:"Yellow Mud Turtle" , scientific_name:"Kinosternon flavescens" , category: "Reptile", description: "Shell hard, smooth, oval-shaped, sometimes with extensive attached algae; throat yellow, with several nipplelike projections; lower shell with 11 shields (shield under neck may be partially divided) and with two crosswise hinges, allowing partial closing of the shell; all toes webbed; upper shell up to about 18 cm (7 inches) long, usually less than 14 cm (5.5 inches). Mature male: Lower shell slightly concave; two patches of conspicuous, rough scales on inner surface of each hind leg; tail thick, tipped with a horny nail, extends well beyond rear edge of upper shell, usually curled to one side; grows to larger size than female and has relatively larger head and claws that are longer and more curved. Mature female: No rough scale patches on hind limbs, tail very short, barely reaching rear edge of upper shell. Hatchling: Upper shell usually less than 25 mm (1 inch) long; lower shell boldly black and yellow, black dot on rear border of upper shell scutes. Habitat: Permanent and intermittent streams, permanent ponds, irrigation ditches, soggy fields, marshes, and surrounding grasslands and sandhills; readily colonizes isolated temporary ponds and rain pools away from permanent water. Some spend considerable time burrowed in sandhills in summer. ", approachable:" Do not try to catch them or pick them up. View from a distance and respect their habitat.", status:"State Special Concern" , image:"https://tucsonherpsociety.org/wp-content/uploads/2018/08/Yellow-Mud-Turtle-captive-1024x725.jpg") 

bald_eadgle = Animal.create(common_name: "Bald Eagle" , scientific_name: "Haliaeetus leucocephalus" , category: "Bird", description: "The bald eagle – so named because of its white head – is found only in North America and is one of the contin​ent’s largest birds of prey. Here in the United States, the bald eagle is recognized as the country’s national symbol, a distinction it has held since 1782. Young bald eagles are dark brown in color when they fledge the nest at about 12 weeks of age. Their head and tail feathers turn predominantly white in the fourth or fifth year. Adult males weigh about eight to nine pounds. Females are slightly larger, about 10 to 14 pounds. The birds’ length is 31 to 37 inches with a wingspan of six to 7.5 feet." , approachable: "The US Fish & Wildlife Service recommends that people can help bald eagle conservation efforts continue by leaving them and their nests undisturbed if encountered in the wild." , status: "State Special Concern" , image:"https://images.unsplash.com/photo-1568747124502-5f249260e7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60")
northernflicker =Animal.create(common_name:"Northern Flicker" , scientific_name:"Colaptes auratus" , category: "Bird", description:"Northern Flickers spend lots of time on the ground, and when in trees they’re often perched upright on horizontal branches instead of leaning against their tails on a trunk. They fly in an up-and-down path using heavy flaps interspersed with glides, like many woodpeckers. Flickers appear brownish overall with a white rump patch that’s conspicuous in flight and often visible when perched. The undersides of the wing and tail feathers are bright yellow, for eastern birds, or red, in western birds. With a closer look you’ll see the brown plumage is richly patterned with black spots, bars, and crescents." , approachable:"View from a distance and respect their habitat" , status: "N/A" , image: "https://www.allaboutbirds.org/guide/assets/photo/60403261-480px.jpg")
chickadee = Animal.create(common_name:"Black-capped chickadee" , scientific_name:"Poecile atricapillus" , category: "Bird", description:"Found in the northern half of the continent, this small round bird has the shape of an egg with wings. As the name suggests, they have black heads, and a call that sounds like “chick-a-dee.” They’re extremely curious and are not shy about visiting feeders. They have an affinity for suet, sunflower and peanuts." , approachable:"View from a distance and respect their habitat" , status:"N/A" , image:"https://20dqe434dcuq54vwy1wai79h-wpengine.netdna-ssl.com/wp-content/uploads/2017/03/c18e3bac1c4fe6c0b7abf67c622ffe08.jpg")
burrowing_owl = Animal.create(common_name:"Burrowing Owl" , scientific_name:"Athene cuniculalria" , category: "Bird", description:"A small, long-legged, short-tailed but long-winged owl. It has a distinctive 'flattened' head shape and facial pattern with brown cap, white eyebrows, large yellow eyes, and a white throat. This owl does not have ear tuffs. The adult's body is mottled brown and white overall with a spotted (or barred) dark brown and buffy breast. The young (juveniles) lack the spotted chest and have few spots on their backs and they have a dark neck collar. Both the adult male and female are the same size. A bobbing, or deep knee bend, often seen in disturbed birds, is distinctive to this owl species. It is most likely the only owl you will see during the day perched a fence post or on the ground in open habitats (grasslands, desert and agricultural areas). Burrowing owls are diurnal, hunting both day and night.  Although burrowing owls can dig their own burrows, they usually occupy burrows that have been dug by other small mammals such as prairie dogs, ground squirrels, and even badgers." , approachable: "View from a distance and respect their habitat. Federal and state laws prohibit the harming or killing of burrowing owls and the destruction of active nests. It is quite possible to inadvertently kill burrowing owls during prairie dog poisoning projects, removal of prairie dogs, destruction of burrows and prairie dogs using a concussive device, or during earth moving for construction. Because burrowing owls often hide in burrows when alarmed, it is not practical to haze the birds away from prairie dog towns prior to prairie dog poisoning/removal, burrow destruction, or construction activity. Because of this, the Colorado Division of Wildlife recommends surveying prairie dog towns for burrowing owl presence before potentially harmful activities are initiated." , status:"State Threatened" , image: "https://images.unsplash.com/photo-1491328480217-db46cf0876c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60")
magpie = Animal.create(common_name:"Black-billed magpie" , scientific_name:"Pica hudsonia" , category: "Bird", description: "Black and white with blue in their wings and long tails, these social birds can often be found in groups feeding on carrion or, more pleasantly, eating fruit, grain, insects or other things in your yard. You can find them throughout most of the West in groups atop fences and utility poles, often squawking in what sounds like anger.", approachable:"View from a distance and respect their habitat", status:"N/A" , image:"https://images.unsplash.com/photo-1502116789488-8f0c6d794de6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60") 



