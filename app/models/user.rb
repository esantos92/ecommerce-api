# frozen_string_literal: true

class User < ActiveRecord::Base
  include NameSearchable
  include Paginatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name,
            :profile, presence: true

  enum profile: { admin: 0, client: 1 }
end
