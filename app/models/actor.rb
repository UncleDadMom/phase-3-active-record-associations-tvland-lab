class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    roles = self.characters
    roles.map {|role| "#{role.name} - #{role.show.name}"}
  end
end