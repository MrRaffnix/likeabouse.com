categories = [ 
  { name: 'Rails'     , description: 'All about Ruby on Rails // the mashup framework' },
  { name: 'Ruby'      , description: 'All about Ruby' },
  { name: 'Javascript', description: 'It is dynamic: Javascript incoming' },
  { name: 'Agile'     , description: 'Agile / Project Management / Scrum / Kanban / XP ...' },
  { name: 'Tools'     , description: 'Tools that make your life easier. or raises the fun... however?!' },
  { name: 'Fun'       , description: 'Funny Stories about funny things' },
  { name: 'Misc'      , description: 'No other category fits' }
]
categories.each do |category|
  Category.seed(:name) do |s|
    s.name        = category[:name]
    s.description = category[:description]
  end
end  
