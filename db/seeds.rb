# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
DIRECTION_NAMES = ['Аппаратная косметология', 'Инъекционная косметология',
                   'Коррекция фигуры', 'Лазерная косметология',
                   'Удаление новообразований', 'Эстетическая косметология'].freeze

DIRECTION_NAMES.each do |direction_name|
  Direction.create(name: direction_name)
end

SERVICES = [
  ['Аппаратная косметология', 'Лечение акне', 60],
  ['Аппаратная косметология', 'Удаление растяжек', 190],
  ['Аппаратная косметология', 'Удаление шрамов', 50],
  ['Аппаратная косметология', 'Миостимуляция', 70],
  ['Аппаратная косметология', 'Лечение постакне', 50],
  ['Аппаратная косметология', 'Аппаратный лифтинг', 70]
].freeze

SERVICES.each do |service|
  Service.create(direction: Direction.find_by_name(service[0]), name: service[1], price: service[2])
end

