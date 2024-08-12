extends Node

enum CategoryType {ANIMALS = 0, HUMAN = 1, NATURAL_DISASTERS = 2, EMOTIONS = 3}

var _categories: Dictionary = {
	CategoryType.ANIMALS: {
		"name": "Животные",
		"icon": "res://assets/category-icons/animals.png"
	},
	CategoryType.HUMAN: {
		"name": "Человек",
		"icon": "res://assets/category-icons/human.png"
	},
	CategoryType.NATURAL_DISASTERS: {
		"name": "Стихийные бедствия",
		"icon": "res://assets/category-icons/natural_disasters.png"
	},
	CategoryType.EMOTIONS: {
		"name": "Эмоции",
		"icon": "res://assets/category-icons/emotions.png"
	}
}

var _elements: Dictionary = {
	"cat": {
		"name": "Кошка",
		"icon": "res://assets/element-icons/cat.png",
		"category" : CategoryType.ANIMALS
	},
	"love": {
		"name": "Любовь",
		"icon": "res://assets/element-icons/love.png",
		"category" : CategoryType.EMOTIONS
	},
	"soul": {
		"name": "Душа",
		"icon": "res://assets/element-icons/soul.png",
		"category" : CategoryType.HUMAN
	},
	"hope": {
		"name": "Надежда",
		"icon": "res://assets/element-icons/hope.png",
		"category" : CategoryType.EMOTIONS
	},
	"eruption": {
		"name": "Огонь",
		"icon": "res://assets/element-icons/eruption.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"tornado": {
		"name": "Ветер",
		"icon": "res://assets/element-icons/tornado.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"fear": {
		"name": "Страх",
		"icon": "res://assets/element-icons/fear.png",
		"category" : CategoryType.EMOTIONS
	},
	"bat": {
		"name": "Летучая мышь",
		"icon": "res://assets/element-icons/bat.png",
		"category" : CategoryType.ANIMALS
	},
	"blood": {
		"name": "Кровь",
		"icon": "res://assets/element-icons/blood.png",
		"category" : CategoryType.HUMAN
	},
	"earthquake": {
		"name": "Земля",
		"icon": "res://assets/element-icons/earthquake.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"eyes": {
		"name": "Глаза",
		"icon": "res://assets/element-icons/eyes.png",
		"category" : CategoryType.HUMAN
	},
	"fox": {
		"name": "Лиса",
		"icon": "res://assets/element-icons/fox.png",
		"category" : CategoryType.ANIMALS
	},
	"hatred": {
		"name": "Ненависть",
		"icon": "res://assets/element-icons/hatred.png",
		"category" : CategoryType.EMOTIONS
	},
	"sadness": {
		"name": "Печаль",
		"icon": "res://assets/element-icons/sadness.png",
		"category" : CategoryType.EMOTIONS
	},
	"sea": {
		"name": "Вода",
		"icon": "res://assets/element-icons/sea.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"snake": {
		"name": "Змея",
		"icon": "res://assets/element-icons/snake.png",
		"category" : CategoryType.ANIMALS
	},
	"wolf": {
		"name": "Волк",
		"icon": "res://assets/element-icons/wolf.png",
		"category" : CategoryType.ANIMALS
	},
	"voice": {
		"name": "Голос",
		"icon": "res://assets/element-icons/voice.png",
		"category" : CategoryType.HUMAN
	}
}

var _folklores: Dictionary ={
	"bastet": {
		"name": "Бастет",
		"icon": "res://assets/folklore/bastet.png",
		"description": "Мифология Древнего Египта. Величественное существо с телом женщины и головой кошки. Она олицетворяет домашнее благополучие и защиту.",
		"tip" : "Подсказка: может самое популярное и милое существо в интернете + самое сильное человеческое чувство.",
		"source_1": "cat",
		"source_2": "love",
		"state": "closed"
	},
	"succubus": {
		"name": "Суккуб",
		"icon": "res://assets/folklore/succubus.png",
		"description": "Соблазнительное существо, поглощает жизненную энергию людей. Оно использует свои чары и красоту, чтобы заманивать жертв и питаться их силами.",
		"tip" : "Подсказка: у людей есть ЭТО и оно остаётся после смерти. Этот фольклор питается этим, обольщяя своих жертв.",
		"source_1": "soul",
		"source_2": "love",
		"state": "closed"
	},
	"phoenix": {
		"name": "Феникс",
		"icon": "res://assets/folklore/phoenix.png",
		"description": "Феникс — мифическая птица, которая сгорает и возрождается из своего пепла. Этот цикл символизирует вечное обновление и бессмертие.",
		"tip" : "Подсказка: если вы заблудитесь зимой и замёрзнете, то ЭТО вселит в вас ЭТО чувство.",
		"source_1": "hope",
		"source_2": "eruption",
		"state": "closed"
	},
	"harpy": {
		"name": "Гарпия",
		"icon": "res://assets/folklore/harpy.png",
		"description": "Гарпия — существо из греческой мифологии, наполовину женщина, наполовину птица. Они похищают души и приносят разрушение.",
		"tip" : "Подсказка: завывает по ночам и вселяет ЭТО в вас.",
		"source_1": "fear",
		"source_2": "tornado",
		"state": "closed"
	},
	"banshi": {
		"name": "Банши",
		"icon": "res://assets/folklore/banshi.png",
		"description": "Ирландский фольклор. Призрачная фигура, известная своими пронзительными криками, предвещающими смерть.",
		"tip" : "Подсказка: из каких элементов состоит грустная песня? Из этого же состоит этот фольклор.",
		"source_1": "voice",
		"source_2": "sadness",
		"state": "closed"
	},
	"gorgon": {
		"name": "Медуза Горгона",
		"icon": "res://assets/folklore/gorgon.png",
		"description": "Древнегреческая мифология. страшное существо с змеями вместо волос, чей взгляд превращает людей в камень.",
		"tip" : "Подсазка: её одолел Персей, великий герой Греции, с помощью зеркала и смекалки.",
		"source_1": "snake",
		"source_2": "eyes",
		"state": "closed"
	},
	"ifrit": {
		"name": "Ифрит",
		"icon": "res://assets/folklore/ifrit.png",
		"description": "Арабская мифология. Могущественное и огненное существо, обладающее огромной силой и разрушительными способностями, и, кстати, очень злое.",
		"tip" : "Подсказка: эти два элемента ассоцирируется с одним цветом – красным.",
		"source_1": "eruption",
		"source_2": "hatred",
		"state": "closed"
	},
	"siren": {
		"name": "Сирена",
		"icon": "res://assets/folklore/siren.png",
		"description": "Сирена — существо из греческой мифологии, наполовину женщина, наполовину рыба, чье пение завлекает моряков на гибель.",
		"tip" : "Подсказка: нечестные советники ассоцирируются с этими двумя элементами.",
		"source_1": "voice",
		"source_2": "snake",
		"state": "closed"
	},
	"vampire_cat": {
		"name": "Кот-Вампир",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Существо из Японского фольклора. Как-то в Японии кошка превратилась в вампира-женщину и начала питаться жизненными силами семьи Набэсима.",
		"tip" : "Подсказка: самое милое животные совмещённое с самым романтизированным монстром.",
		"source_1": "cat",
		"source_2": "bat",
		"state": "closed"
	},
	"promethean_fire": {
		"name": "Огонь Прометея",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Огонь Прометея — это огонь, который титановый Прометей украл у богов, чтобы дать человечеству.",
		"tip" : "Подсказка: ЭТОТ элемент сделал человеческую жизнь намного проще. Вдвойне проще!",
		"source_1": "eruption",
		"source_2": "eruption",
		"state": "closed"
	},
	"dragon_ball": {
		"name": "Жемчуг дракона",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Жемчуг Дракон — мистический драгоценный камень из восточной мифологии, обладающий магической силой.",
		"tip" : "Подсказка: Где обитает Губка Боб?",
		"source_1": "sea",
		"source_2": "sea",
		"state": "closed"
	},
	"catsith": {
		"name": "Кошка Ситх",
		"icon": "res://assets/folklore/Catsith.png",
		"description": "Мифическое существо из шотландского и ирландского фольклора. Оно может похищать души умерших, проходя мимо их тел перед похоронами.",
		"tip" : "Подсказка: ЭТО остаётся после смерти. Знаете у кого 9 жизней?",
		"source_1": "cat",
		"source_2": "soul",
		"state": "closed"
	},
	"camazotz": {
		"name": "Камазотц",
		"icon": "res://assets/folklore/camazotz.png",
		"description": "Демон-летучая мышь из майяской мифологии. Он обитает в подземных мирах и воплощает страх перед темнотой.",
		"tip" : "Подсказка: ЭТО животное чаще всего живёт в пещерах. А где пещеры находятся?",
		"source_1": "bat",
		"source_2": "earthquake",
		"state": "closed"
	},
	"cerbeus": {
		"name": "Цербер",
		"icon": "res://assets/folklore/cerberus.png",
		"description": "Древнегреческая мифология. Огромное чудовище с тремя головами, охраняющее вход в мир мёртвых.",
		"tip" : "Подсказка: эти животные часто болеют бешенством. Во время нападения этого животного человек теряет много ЭТОГО.",
		"source_1": "blood",
		"source_2": "wolf",
		"state": "closed"
	},
	"redcap": {
		"name": "Красный колпак",
		"icon": "res://assets/folklore/redcap.png",
		"description": "Красный колпак— злой дух британского фольклора, живущий в заброшенных замках. Он окрашивает шапку в кровь своих жертв, убивая всех, кто вторгается на его территорию.",
		"tip" : "Подсказка: в войнах прливается много ЭТОГО элемента и из-за ДРУГОГО элемента.",
		"source_1": "hatred",
		"source_2": "blood",
		"state": "closed"
	},
	"fujin": {
		"name": "Фудзин",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Фудзин — японский бог ветра, изображаемый с мешком, в котором хранится ветер. Он управляет ветрами и бурями, и считается защитником от злых духов",
		"tip" : "Подсказка: Стихия, которая несет холод и беспокойство, и чувство, которое вызывает разрушение и отторжение.",
		"source_1": "tornado",
		"source_2": "hatred",
		"state": "closed"
	},
	"weeping_woman": {
		"name": "Плакашильца",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Ла Льорона, или Плачущая Женщина, — мексиканская легенда о призраке, который ищет своих потерянных детей. Её плач предвещает беду и символизирует горе.",
		"tip" : "Подсказка: Человека воет от этого чувства, а что ещё воет?",
		"source_1": "tornado",
		"source_2": "sadness",
		"state": "closed"
	},
	"werewolf": {
		"name": "Оборотень",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Оборотень — мифическое существо, способное превращаться из человека в волка, особенно в полнолуние.",
		"tip" : "Подсказка: если бешеное ЭТО на вас нападёт, то вы потеряете много ЭТОЙ жидкости.",
		"source_1": "wolf",
		"source_2": "blood",
		"state": "closed"
	},
	"basilisk": {
		"name": "Василиск",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Вассилиск — мифическое существо. Его взгляд или дыхание могут убивать и вызывать смерть, что делает его символом разрушительной силы и опасности.",
		"tip" : "Подсказка: длинное и хорошо видит по ночам.",
		"source_1": "eyes",
		"source_2": "snake",
		"state": "closed"
	},
	"rudzin": {
		"name": "Рюдзин",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Это легендарный дракон из японской мифологии. Он известен как повелитель морей и считается одним из могущественных и древних духов, связанных с водой. ",
		"tip" : "Подсказка: у этих двух элементов есть одна общая черта – холод.",
		"source_1": "snake",
		"source_2": "sea",
		"state": "closed"
	},
	"kitsune": {
		"name": "Рюдзин",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Существо из Японского фольклора, способное превращаться в людей. Играет роль трикстера, иллюзиониста, трикстера. Живёт около тысячи лет.",
		"tip" : "Подсказка: обольстители добиваются ЭТОГО от своих жертв. Обольстители же обладают ДРУГОЙ чертой, которую ассоцирируют с одним животным.",
		"source_1": "love",
		"source_2": "fox",
		"state": "closed"
	},
	"koyote": {
		"name": "Койот",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Североамериканский фольклор. Это хитрое и изобретательное существо, известное своими проделками и обманом.",
		"tip" : "Подсказка: у этих элементов есть такие общие черты: подлость и хитрость.",
		"source_1": "snake",
		"source_2": "fox",
		"state": "closed"
	},
	"cu_sith": {
		"name": "Собака мира",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Ку-Ситх — мифическое существо из шотландского фольклора, демоническая черная собака с огненным взглядом.",
		"tip" : "Подсказка: осторожно, злая тварь. И она смотрит прямо в то, что у человека остаётся после смерти.",
		"source_1": "wolf",
		"source_2": "soul",
		"state": "closed"
	},
	"kanashibari": {
		"name": "Канашибари",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Японский фольклор. Зловещее существо. Является людям во время сонных паралечей.",
		"tip" : "Подсказка: возьмите самые худшие эмоции человека и воображение сделает из этого ЭТОТ ужас.",
		"source_1": "hatred",
		"source_2": "fear",
		"state": "closed"
	},
	"vampire": {
		"name": "Вампир",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Это бессмертное существо, которое питается кровью живых. Он скрывается в тени и выходит на охоту ночью, вселяя страх в сердца людей.",
		"tip" : "Подсказка: летают и кусают, а ещё сосут у человека кое-что.",
		"source_1": "bat",
		"source_2": "blood",
		"state": "closed"
	},
}

func get_category_name(category: CategoryType) -> String:
	return (_categories.get(category) as Dictionary).get("name") as String

func get_category_icon_path(category: CategoryType) -> String:
	return (_categories.get(category) as Dictionary).get("icon") as String

func get_element_name(element_db_name: String) -> String:
	return (_elements.get(element_db_name) as Dictionary).get("name") as String

func get_element_icon_path(element_db_name: String) -> String:
	return (_elements.get(element_db_name) as Dictionary).get("icon") as String

func get_element_category(element_db_name: String) -> CategoryType:
	return (_elements.get(element_db_name) as Dictionary).get("category") as CategoryType

func get_elements_by_category(category: CategoryType) -> Array[String]:
	var elements: Array[String] = []
	for key: String in _elements.keys() as Array[String]:
		var element: Dictionary = _elements.get(key) as Dictionary
		if(element.get("category") == category):
			elements.push_back(key)
	return elements

func get_folklores_elements_bd_names() -> Array[String]:
	var bd_names: Array[String] = []
	for key: String in _folklores.keys() as Array[String]:
		bd_names.push_back(key)
	return bd_names

func get_folklores_elements_sources(folklore_db_name: String) -> Array[String]:
	var sources: Array[String] = []
	sources.push_back((_folklores.get(folklore_db_name) as Dictionary).get("source_1"))
	sources.push_back((_folklores.get(folklore_db_name) as Dictionary).get("source_2"))
	return sources

func get_folklore_element_name(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("name") as String

func get_folklore_element_icon_path(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("icon") as String

func get_folklore_element_description(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("description") as String

func get_folklore_element_tip(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("tip") as String

## If element opened then return "opened"
## else return "closed"
func get_folklore_state(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("state")

func set_folklore_element_to_open(folklore_db_name: String) -> void:
	(_folklores[folklore_db_name])["state"] = "opened"

func get_folklore_element_name_by_sources(source_1: String, source_2: String) -> String:
	for key: String in _folklores.keys() as Array[String]:
		var folklore_dict: Dictionary = _folklores.get(key)
		var tmp_source_1: String = folklore_dict.get("source_1")
		var tmp_source_2: String = folklore_dict.get("source_2")
		if( source_1 == tmp_source_1 and source_2 == tmp_source_2
		or source_2 == tmp_source_1 and source_1 == tmp_source_2):
				return key
	return "invalid_sources"

func is_folklore_element_closed(folklore_db_name: String)->bool:
	var state: String = (_folklores.get(folklore_db_name) as Dictionary).get("state") as String
	if(state == "closed"):
		return true
	return false
