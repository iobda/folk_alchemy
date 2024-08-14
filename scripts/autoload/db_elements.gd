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
		"description": "Древнеегипетская богиня кошек, домашнего уюта и плодородия. В древнем Египте кошки считались священными, а их убийство было тяжким преступлением, караемым смертью.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] самое популярное и милое существо в интернете + [color=green]ЭТО[/color] самое сильное человеческое чувство.",
		"source_1": "cat",
		"source_2": "love",
		"state": "closed"
	},
	"succubus": {
		"name": "Суккуб",
		"icon": "res://assets/folklore/succubus.png",
		"description": "Демон женского облика в легендах, который соблазнял мужчин во сне, высасывая их душу. Считалось, что защита от него — молитвы и святая вода.",
		"tip" : "Подсказка: у людей есть [color=green]ЭТО[/color] и оно остаётся после смерти. То нужно совместить с [color=green]ЭТИМ[/color] самым тёплым чувством у человека.",
		"source_1": "soul",
		"source_2": "love",
		"state": "closed"
	},
	"phoenix": {
		"name": "Феникс",
		"icon": "res://assets/folklore/phoenix.png",
		"description": "Мифическая птица, возрождающаяся из пепла после смерти. Феникс символизирует надежду и новое начало, всегда возвращаясь к жизни после гибели.",
		"tip" : "Подсказка: если вы заблудитесь зимой и замёрзнете, то [color=green]ЭТО[/color] вселит в вас [color=green]ЭТО[/color] чувство.",
		"source_1": "hope",
		"source_2": "eruption",
		"state": "closed"
	},
	"harpy": {
		"name": "Гарпия",
		"icon": "res://assets/folklore/harpy.png",
		"description": "Древнегреческое существо, известное своей жестокостью. Считалось, что их зловещие крики могли внезапно вызвать страх и панику у тех, кто их слышал.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] завывает по ночам и вселяет [color=green]ЭТО[/color] в вас.",
		"source_1": "fear",
		"source_2": "tornado",
		"state": "closed"
	},
	"banshi": {
		"name": "Банши",
		"icon": "res://assets/folklore/banshi.png",
		"description": "Из ирландских легенд, дух предвестника смерти. Говорят, что её громкий и жуткий крик мог вызвать сильные ветры и даже торнадо, предвещая беду.",
		"tip" : "Подсказка: с помощью [color=green]ЭТОГО[/color] и [color=green]ЭТОГО[/color] у нас получается произность звуки.",
		"source_1": "voice",
		"source_2": "tornado",
		"state": "closed"
	},
	"gorgon": {
		"name": "Медуза Горгона",
		"icon": "res://assets/folklore/gorgon.png",
		"description": "Из древнегреческих мифов, медуза горгона имела взгляд, превращающий людей в камень. Легенды говорят, что её взгляд был настолько ужасен, что никто не мог выдержать его.",
		"tip" : "Подсазка: её одолел Персей, великий герой Греции, с помощью зеркала и смекалки.",
		"source_1": "snake",
		"source_2": "eyes",
		"state": "closed"
	},
	"ifrit": {
		"name": "Ифрит",
		"icon": "res://assets/folklore/ifrit.png",
		"description": "Из арабских сказок, ифрит был огненным духом, полным ненависти. Говорят, что его гнев был настолько силен, что мог вызывать разрушения и бедствия.",
		"tip" : "Подсказка: [color=green]ЭТИ[/color] два элемента ассоцирируется с одним цветом – красным.",
		"source_1": "eruption",
		"source_2": "hatred",
		"state": "closed"
	},
	"siren": {
		"name": "Сирена",
		"icon": "res://assets/folklore/siren.png",
		"description": "Из греческих мифов, сирена своими чарующими песнями заманивала моряков к гибели, потому что её голос был настолько привлекательным, что никто не мог устоять.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] животное может шипеть. [color=green]ЭТО[/color] нужно человеку чтобы шипеть.",
		"source_1": "voice",
		"source_2": "snake",
		"state": "closed"
	},
	"vampire_cat": {
		"name": "Кот-Вампир",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Из японского фольклора, вампир-кот, или \"канэко\", был ночным существом, высасывающим кровь. Считалось, что он мог превращаться в обычного кота, чтобы обмануть людей.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] самое милое животные совмещённое с [color=green]ТЕМ[/color], кто спить днём.",
		"source_1": "cat",
		"source_2": "bat",
		"state": "closed"
	},
	"promethean_fire": {
		"name": "Огонь Прометея",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Из древнегреческой мифологии, огонь Прометея был даром людям, символизируя надежду и прогресс. Этот огонь принес знания и развитие, несмотря на страдания самого Прометея.",
		"tip" : "Подсказка: [color=green]ЭТОТ[/color] элемент сделал человеческую жизнь намного проще. [color=green]ВДВОЙНЕ[/color] проще!",
		"source_1": "eruption",
		"source_2": "eruption",
		"state": "closed"
	},
	"dragon_ball": {
		"name": "Жемчуг дракона",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Из китайской мифологии, жемчуг дракона символизирует могущество и мудрость. Говорят, что он был найден на морском дне и мог успокаивать штормы и приносить удачу морякам.",
		"tip" : "Подсказка: Где обитает Губка Боб?",
		"source_1": "sea",
		"source_2": "sea",
		"state": "closed"
	},
	"catsith": {
		"name": "Кошка Ситх",
		"icon": "res://assets/folklore/Catsith.png",
		"description": "Из ирландского фольклора, кошка Ситх могла поглощать души и предсказывать будущее, используя силу тех душ, которые захватывала.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] остаётся после смерти. У [color=green]ЭТОГО[/color] есть 9 жизней.",
		"source_1": "cat",
		"source_2": "soul",
		"state": "closed"
	},
	"camazotz": {
		"name": "Камазотц",
		"icon": "res://assets/folklore/camazotz.png",
		"description": "Из майянской мифологии, Камазотц, бог летучих мышей и ночи, жил в пещере. Считалось, что он поглощал души и приносил тьму тем, кто осмеливался войти в его обитель.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] животное чаще всего живёт в пещерах. Оно живёт под [color=green]ЭТИМ[/color].",
		"source_1": "bat",
		"source_2": "earthquake",
		"state": "closed"
	},
	"cerbeus": {
		"name": "Цербер",
		"icon": "res://assets/folklore/cerberus.png",
		"description": "Цербер из древнегреческих мифов охранял вход в подземное царство; его лохматая шкура была пропитана кровью тех, кто пытался сбежать.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] животное часто болеет бешенством. Во время нападения этого животного человек теряет много [color=green]ЭТОГО[/color].",
		"source_1": "blood",
		"source_2": "wolf",
		"state": "closed"
	},
	"redcap": {
		"name": "Красный колпак",
		"icon": "res://assets/folklore/redcap.png",
		"description": "Кровавый колпак — это чрезвычайно злой и убийственный тип гоблина, часто упоминаемый в английском фольклоре.",
		"tip" : "Подсказка: в войнах проливается много [color=green]ЭТОГО[/color] и из-за [color=green]ДРУГОГО[/color].",
		"source_1": "hatred",
		"source_2": "blood",
		"state": "closed"
	},
	"fujin": {
		"name": "Фудзин",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Фудзин из японской мифологии — бог ветра; он управляет бурями с помощью мешка, наполненного ветром, который может вызвать как разрушение, так и очищение.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] то, благодаря чему шумят листья и кусты.",
		"source_1": "tornado",
		"source_2": "tornado",
		"state": "closed"
	},
	"weeping_woman": {
		"name": "Плакашильца",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Ла Льорона из мексиканского фольклора — дух плачущей женщины, которая ищет своих детей; её рыдания приносят ужас и предвещают несчастье.",
		"tip" : "Подсказка: Человека воет от [color=green]ЭТОГО[/color] чувства, и [color=green]ЭТО[/color] воет само по себе.",
		"source_1": "tornado",
		"source_2": "sadness",
		"state": "closed"
	},
	"werewolf": {
		"name": "Оборотень",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Оборотень из европейских мифов — человек, способный превращаться в волка; считается, что его трансформация вызвана злым колдовством или проклятием.",
		"tip" : "Подсказка: вы испытаете [color=green]ЭТО[/color] при виде [color=green]ЭТОГО[/color] в лесу.",
		"source_1": "wolf",
		"source_2": "fear",
		"state": "closed"
	},
	"basilisk": {
		"name": "Василиск",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Василиск из европейских мифов — гигантское змееподобное существо; его огромные размеры делают его крайне опасным для любого, кто попадается ему на пути.",
		"tip" : "Подсказка: [color=green]ЭТО ВДВОЙНЕ[/color] длинное существо.",
		"source_1": "snake",
		"source_2": "snake",
		"state": "closed"
	},
	"rudzin": {
		"name": "Рюдзин",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Рюдзин из японской мифологии — бог драконов и морей; его могущество настолько велико, что он управляет морскими штормами и приливами.",
		"tip" : "Подсказка: у [color=green]ЭТИХ[/color] двух элементов есть одна общая черта – холод.",
		"source_1": "snake",
		"source_2": "sea",
		"state": "closed"
	},
	"kitsune": {
		"name": "Кицунэ",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Кицунэ из японской мифологии — лиса, обладающая магическими способностями; считается, что она может превращаться в женщину и жить тысячу лет.",
		"tip" : "Подсказка: соблазнители добиваются [color=green]ЭТОЙ[/color] эмоции у своих жертв. Это требует хитрости, которая ассоцириуется с [color=green]ЭТИМ[/color] животным.",
		"source_1": "love",
		"source_2": "fox",
		"state": "closed"
	},
	"koyote": {
		"name": "Койот",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Койот из североамериканского фольклора — хитрое и смелое существо, часто выступающее как обманщик и лукавый культурный герой, вызывающий бурю своими шалостями.",
		"tip" : "Подсказка: у [color=green]ЭТИХ[/color] элементов есть общая черта. Оба ассоцирируются с подлость и хитростью.",
		"source_1": "snake",
		"source_2": "fox",
		"state": "closed"
	},
	"cu_sith": {
		"name": "Ку-Ситх",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Ку-Ситх из шотландского фольклора — мифический гигантский пес; его завывание предсказывает смерть, и он охраняет места, связанные с миром мёртвых.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] остается у человека после смерти. [color=green]ЭТО[/color] нужно часто выгуливать человеку.",
		"source_1": "wolf",
		"source_2": "soul",
		"state": "closed"
	},
	"kanashibari": {
		"name": "Канашибари",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Канашибари из японского фольклора — дух, вызывающий паралич во сне; её ненависть к людям проявляется в том, что он мешает им двигаться и вызывает страх.",
		"tip" : "Подсказка: возьмите [color=green]ЭТИ[/color] самые худшие эмоции человека и воображение сделает из этого этот фольклор.",
		"source_1": "hatred",
		"source_2": "fear",
		"state": "closed"
	},
	"vampire": {
		"name": "Вампир",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Вампир из европейского фольклора — существо, питающееся кровью; Он способен превращаться в летучую мышь.",
		"tip" : "Подсказка: [color=green]ЭТО[/color] кусает человека и сосёт [color=green]ЭТО[/color] у человека.",
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
