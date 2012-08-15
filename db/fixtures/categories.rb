categories = [
  { name: 'Ruby Gems'   , order: 1, description: 'Ruby, Rails & Gems' },
  { name: 'Fancyness'   , order: 2, description: 'Funny Websites, Cool Stuff, Sites we would do if we could' },
  { name: 'HTML5/CSS3'  , order: 3, description: 'All about fancy HTML5 or CSS3 Stuff we found and wonder about the future of internet' },
  { name: 'Being Agile' , order: 4, description: 'Agile / Project Management / Scrum / Kanban / XP ...' },
  { name: 'Tools'       , order: 5, description: 'Tools that make your life easier. or raises the fun... however?!' },
  { name: 'Fun'         , order: 6, description: 'All that funny stuff - when you read - somewhere' },
  { name: 'Javascript'  , order: 7, description: "Javascript, the future of web?!" },
  { name: 'Misc'        , order: 8, description: 'All what we could not in there...' }

]
categories.each do |category|
  Category.seed(:name) do |s|
    s.name        = category[:name]
    s.rank        = category[:order]
    s.description = category[:description]
  end
end
