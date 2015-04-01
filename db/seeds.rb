# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

#create Yason
Product.create!(title: 'Ясон',
                description: %{<p>Семена подсолнечника Ясон -
                высокоурожайный пластичный гибрид подсолнечника.
                Оригинатором гибрида Ясон является институт растениеводства
                им. В.Я. Юрьева и институт полевых, овощных культур Нови сад Сербия.</p>},
                image_url: 'semena.png',
                price: 1000)
#create Dariy
Product.create!(title: 'Дарий',
                description: %{<p>Семена гибрида <em>Дарий</em> инкрустированы и протравлены ипортными
                препаратами. Подготовка семян произведена на оборудовании немецкой компании
                "Petkus", что позволило добиться максимального качества семян. Упаковка семян
                подсолнечника Дарий производится в бумажные четырехслойные мешки.</p>},
                image_url: 'semena.png',
                price: 1200)

#create Forward
Product.create!(title: 'Форвард',
                description: %{Семена подсолнечника <em>Форвард</em> - Очень пластичный к технологии возделывания
                гибрид подсолнечника. Оригинатором гибрида Форвард является институт растениеводства
                им. В.Я. Юрьева.},
                image_url: 'semena.png',
                price: 1300)

#create Diamond
Product.create!(title: 'Алмаз',
                description: %{<p>Данный сорт кондитерсокого подсолнечника является одним из самых удачных
                в нише кондитерских сортов подсолнечника и отличается от других сортов подсолнечника
                стабильными показателями по урожайности и крупноплодности даже в условиях засухи. Сорт
                кондитерского подсолнечника Алмаз стойкий к болезням, к полеганию, что особенно важно
                для сортов подсолнечника кондитерского назначения. Рекомендуемая густота стояния на
                момент уборки 30-35 тыс. растений  в условиях Степи и 35-40 тыс. растений в условиях
                Лесостепи.</p>},
                image_url: 'semena.png',
                price: 1100)