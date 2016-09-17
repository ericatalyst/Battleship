class Game < ApplicationRecord
  belongs_to :player_1, class_name: 'User'
  belongs_to :player_2, class_name: 'User', required: false
  has_many :ships
  has_many :tiles

  def create_tiles(user_id)
    rows = %w(a b c d e f g h i j)
    cols = %w(1 2 3 4 5 6 7 8 9 10)
    rows.each do |letter|
      cols.each do |number|
        coord = letter + ", " + number
        Tile.create(coordinates: coord, game_id: self.id, player_id: user_id)
      end
    end
  end

  def create_opponent_tiles(opponent_id)
    rows = %w(a b c d e f g h i j)
    cols = %w(1 2 3 4 5 6 7 8 9 10)
    rows.each do |letter|
      cols.each do |number|
        coord = letter + ", " + number
        Tile.create(coordinates: coord, game_id: self.id, player_id: opponent_id)
      end
    end
  end

end
