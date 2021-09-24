# frozen_string_literal: true

# Handles all player related functions
class Player
  attr_accessor :name, :choices, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @choices = []
  end
end
