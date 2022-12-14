# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, :email, uniqueness: true
  validates :username, :email, :password, presence: true
end
