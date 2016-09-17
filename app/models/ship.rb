class Ship < ApplicationRecord
  has_many :tiles
  belongs_to :game
  validates :game, presence: true

private

  def is_destroyed?
    self.tiles.all? { |tile| tile.hit }
  end

end
